import * as readline from "readline";

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

rl.question("Введите числа через пробел: ", (input) => {
  const numbers = input.trim().split(/\s+/).map(Number);
  const count = numbers.filter((num) => Math.abs(num).toString().length % 2 !== 0).length;
  console.log(`Количество чисел с нечётным числом цифр: ${count}`);
  rl.close();
});
