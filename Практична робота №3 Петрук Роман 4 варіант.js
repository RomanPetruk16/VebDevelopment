const students = {
	"Олійник Артем": { math: 85, phisics: 78, chemistry: 92 },
	"Петрук Роман": { math: 90, phisics: 88, chemistry: 80 },
	"Ткачук Валентин": { math: 70, phisics: 75, chemistry: 68 }
};
function calculateAverage(grades) {
	const values = Object.values(grades);
	const sum = values.reduce((acc, grade) => acc + grade, 0);
	return (sum / values.length).toFixed(2);
}
console.log("Список студентів та їх середні бали:");
for (const student in students) {
	const average = calculateAverage(students[student]);
	console.log(`${student}: ${average}`);
}