local QBCore = exports['qb-core']:GetCoreObject()
local isInSafeZone = false
local clearedJobs = {}

local function loadClearedJobs()
    clearedJobs = {}
    for _, job in ipairs(Config['clearedJobs']) do
        clearedJobs[job] = true
    end
end

local function updateJobStatus()
    local PlayerJob = QBCore.Functions.GetPlayerData().job.name
    isClear = clearedJobs[PlayerJob] or false
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    loadClearedJobs()
    updateJobStatus()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', updateJobStatus)

CreateThread(function()
    loadClearedJobs()
    while true do
        local sleep = 1000
        local ped = PlayerPedId()
        local plyCoords = GetEntityCoords(ped)
        local wasInSafeZone = isInSafeZone
        isInSafeZone = false 

        for _, v in pairs(Config["zone"]) do
            local dist = #(plyCoords - vector3(v.x, v.y, v.z))
            if dist <= v.radio then
                sleep = 5
                isInSafeZone = true
                
                SendNUIMessage({ action = "toggleSafezone", show = true })
                
                if not isClear then
                    if Config['godmode'] then
                        SetEntityInvincible(ped, true)
                        SetPlayerInvincible(PlayerId(), true)
                    end

                    if Config['disableCombat'] then
                        DisableControlAction(2, 37, true)
                        DisableControlAction(0, 106, true)
                        DisableControlAction(0, 44, true)
                        DisableControlAction(0, 140, true)
                        DisableControlAction(0, 25, true)
                        DisablePlayerFiring(PlayerId(), true)
                    end

                    local vehicle = GetVehiclePedIsIn(ped, false)
                    if Config['vehicleCollision'] and IsEntityAVehicle(vehicle) then
                        SetEntityCollision(vehicle, true, true)
                    end
                    
                    if not Config['allowWeapons'] then
                        SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
                    end

                    if Config['vehicleCollision'] then
                        for _, veh in ipairs(GetGamePool("CVehicle")) do
                            if vehicle ~= 0 then
                                SetEntityNoCollisionEntity(veh, vehicle, true)
                            else
                                SetEntityNoCollisionEntity(veh, ped, true)
                            end
                        end
                    end

                    for _, player in ipairs(GetActivePlayers()) do
                        if player ~= PlayerId() then
                            SetEntityNoCollisionEntity(GetPlayerPed(player), ped, true)
                        end
                    end
                end
            elseif wasInSafeZone and not isInSafeZone then
                SendNUIMessage({ action = "toggleSafezone", show = false })
                if Config['godmode'] then
                    SetEntityInvincible(ped, false)
                    SetPlayerInvincible(PlayerId(), false)
                end
            end
        end
        Wait(sleep)
    end
end)

CreateThread(function()
    if Config['SAFEZONE'] then
        for k, v in pairs(Config['zone']) do
            if Config['blipEnabled'] then
                local blip = AddBlipForRadius(v.x, v.y, v.z, v.radio)
                SetBlipHighDetail(blip, true)
                SetBlipColour(blip, 2)
                SetBlipAlpha(blip, 128)
            end
        end
    end
end)