Config = {}

Config['SAFEZONE'] = true -- don't touch
Config['godmode'] = true -- true or false
Config['vehicleCollision'] = true -- true ise araç çarpışması engellenir, false ise serbest olur
Config['allowWeapons'] = false -- true ise silah çekilebilir, false ise çekilemez
Config['disableCombat'] = true -- true ise yumruk ve silah saldırıları engellenir, false ise serbest olur
Config['blipEnabled'] = true -- Bliplerin aktif edilip edilmediğini belirler

Config['zone'] = {
    {['x'] = 304.1725, ["y"] = -600.2977, ["z"] = 43.2839, ['radio'] = 50.0}, -- Hastane
    {['x'] = -1037.4039, ["y"] = -2736.6621, ["z"] = 13.7636, ['radio'] = 60.0}, -- Başlangıç
    {['x'] = 325.4017, ["y"] = -210.4565, ["z"] = 57.8998, ['radio'] = 90.0}, -- Motel
    {['x'] = -579.9165, ['y'] = -1059.481, ['z'] = 22.33777, ['radio'] = 80.0},  -- UWU
    {['x'] = -40.88, ['y'] = -1100.43, ['z'] = 34.06, ['radio'] = 55.0},  -- Galeri
    {['x'] = 180.5100, ['y'] = -968.5546, ['z'] = 29.5792, ['radio'] = 90.0},  -- Kamu
    {['x'] = -1828.9862, ['y'] = -1208.2339, ['z'] = 12.9637, ['radio'] = 90.0},  -- İskele
}


Config['clearedJobs'] = {
    "police", "bcso", "davis", "paleto", "kahve", "gtf",
    "ambulance", "sasp", "fbi", "lsfd", "adalet", "doj",
    "kriyus", "bcso2", "marshal"
}
