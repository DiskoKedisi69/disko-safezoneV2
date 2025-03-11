let lastState = null;

window.addEventListener('message', function(event) {
    if (event.data.action === "toggleSafezone") {
        let container = document.getElementById("safezone-container");
        if (event.data.show !== lastState) {
            lastState = event.data.show;
            if (event.data.show) {
                container.classList.remove("hidden");
                container.classList.add("safezone-box");
            } else {
                container.classList.add("hidden");
                container.classList.remove("safezone-box");
            }
        }
    }
});
