let items = JSON.parse(localStorage.getItem("items")) || [];

const listEl = document.getElementById("list"),
      searchEl = document.getElementById("search"),
      messageEl = document.getElementById("message");

function render(filter = "") {
    listEl.innerHTML = "";
    let filtered = items.filter(i => i.text.toLowerCase().includes(filter.toLowerCase()));
    messageEl.style.display = filtered.length ? "none" : "block";
    filtered.forEach(i => {
        let li = document.createElement("li");
        li.textContent = i.text;
        listEl.appendChild(li);
    });
}

document.getElementById("addItem").addEventListener("click", () => {
    let text = document.getElementById("newItem").value.trim();
    if (!text) return;
    items.push({ text, date: Date.now() });
    localStorage.setItem("items", JSON.stringify(items));
    document.getElementById("newItem").value = "";
    render();
});
document.getElementById("sortAlpha").addEventListener("click", () => {
    items.sort((a, b) => a.text.localeCompare(b.text));
    localStorage.setItem("items", JSON.stringify(items));
    render();
});

document.getElementById("sortDate").addEventListener("click", () => {
    items.sort((a, b) => a.date - b.date);
    localStorage.setItem("items", JSON.stringify(items));
    render();
});

searchEl.addEventListener("input", () => render(searchEl.value));

render();
