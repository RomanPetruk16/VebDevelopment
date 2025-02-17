function calcEngine() {
let a = Number(prompt("Введіть перше число:"));
let b = Number(prompt("Введіть друге число:"));
let operation = prompt("Введіть операцію (+, -, *, /):");
let result;

switch (operation) {
    case "+":
        result = a + b;
        break;
    case "-":
        result = a - b;
        break;
    case "*":
        result = a * b;
        break;
    case "/":
        if (b !== 0) {
            result = a / b;
        } else {
            result = "Ділення на нуль неможливе!";
        }
        break;
    default:
        result = "Невідома операція!";
}

alert(`Результат: ${result}`);