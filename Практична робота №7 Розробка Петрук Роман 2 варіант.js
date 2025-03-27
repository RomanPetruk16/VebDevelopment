document.addEventListener("DOMContentLoaded", () => {
    const themeToggle = document.getElementById("theme-toggle");
    const root = document.documentElement;
    const savedTheme = localStorage.getItem("theme") || "light";
    const customColors = JSON.parse(localStorage.getItem("customColors")) || {};

    function applyTheme(theme) {
        root.classList.add("theme-transition");
        root.setAttribute("data-theme", theme);
        localStorage.setItem("theme", theme);
        setTimeout(() => root.classList.remove("theme-transition"), 500);
    }

    function applyCustomColors(colors) {
        Object.keys(colors).forEach(color => {
            root.style.setProperty(`--${color}`, colors[color]);
        });
    }

    applyTheme(savedTheme);
    applyCustomColors(customColors);

    themeToggle.addEventListener("change", () => {
        const newTheme = themeToggle.checked ? "dark" : "light";
        applyTheme(newTheme);
    });

    document.getElementById("save-colors").addEventListener("click", () => {
        const primary = document.getElementById("primary-color").value;
        const secondary = document.getElementById("secondary-color").value;
        const colors = { primary, secondary };
        localStorage.setItem("customColors", JSON.stringify(colors));
        applyCustomColors(colors);
    });
});