function showEvenNumbers(n) {
let n = prompt("Введіть число n:");
n = Number(n);
for (let i = 2; i <= n; i += 2) {
	console.log(i);
}