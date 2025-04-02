const textBlock = document.createElement("div");
textBlock.textContent = "Це текстовий блок";
textBlock.style.padding = "20px";
textBlock.style.border = "1px solid black";
document.body.appendChild(textBlock);

const buttons = [
    { id: "colorBtn", text: "Змінити колір", action: changeColor },
    { id: "fontSizeBtn", text: "Змінити розмір шрифту", action: changeFontSize },
    { id: "backgroundBtn", text: "Змінити фон", action: changeBackground },
    { id: "toggleTextBtn", text: "Сховати/показати текст", action: toggleText },
    { id: "resetBtn", text: "Скинути стилі", action: resetStyles }
];

buttons.forEach(({ id, text, action }) => {
    const btn = document.createElement("button");
    btn.id = id;
    btn.textContent = text;
    btn.addEventListener("click", action);
    document.body.appendChild(btn);
});

function applyStoredStyles() {
    textBlock.style.color = localStorage.getItem("color") || "black";
    textBlock.style.fontSize = localStorage.getItem("fontSize") || "16px";
    textBlock.style.backgroundColor = localStorage.getItem("background") || "white";
    textBlock.style.display = localStorage.getItem("display") || "block";
}

function changeColor() {
    const newColor = prompt("Введіть колір (наприклад, red, blue, green)", "blue");
    if (newColor) {
        textBlock.style.color = newColor;
        localStorage.setItem("color", newColor);
    }
}

function changeFontSize() {
    const newSize = prompt("Введіть розмір шрифту (наприклад, 20px, 24px)", "20px");
    if (newSize) {
        textBlock.style.fontSize = newSize;
        localStorage.setItem("fontSize", newSize);
    }
}

function changeBackground() {
    const newBg = prompt("Введіть колір фону", "yellow");
    if (newBg) {
        textBlock.style.backgroundColor = newBg;
        localStorage.setItem("background", newBg);
    }
}

function toggleText() {
    if (textBlock.style.display === "none") {
        textBlock.style.display = "block";
        localStorage.setItem("display", "block");
    } else {
        textBlock.style.display = "none";
        localStorage.setItem("display", "none");
    }
}

function resetStyles() {
    localStorage.removeItem("color");
    localStorage.removeItem("fontSize");
    localStorage.removeItem("background");
    localStorage.removeItem("display");
    applyStoredStyles();
}

applyStoredStyles();