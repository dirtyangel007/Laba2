import * as readline from "readline";

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

rl.question("Введите числа через пробел: ", (input) => {
  const numbers = input.trim().split(/\s+/).map(Number);
  const resultIndexes: number[] = [];

  numbers.forEach((num, i) => {
    const digits = Math.abs(num).toString().split('').map(Number);
    const sum = digits.reduce((a, b) => a + b, 0);
    const product = digits.reduce((a, b) => a * b, 1);
    if (sum < product) {
      resultIndexes.push(i + 1); // индексация с 1
    }
  });

  console.log("Номера, где сумма цифр < произведения:", resultIndexes.join(" "));
  rl.close();
});
