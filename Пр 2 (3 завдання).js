function factorialCalc() {
let n = prompt("Введіть число для обчислення факторіалу:");
n = Number(n);
let factorial = 1;
let i = 1;
while (i <= n) {
	factorial *= i;
	i++;
}
console.log('Факторіал {n} дорівнює ${factorial}');