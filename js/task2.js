const readline = require("readline");

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.question("Введите числа через пробел: ", (input) => {
  const nums = input.trim().split(" ").map(Number);
  const count = nums.filter(num => num.toString().length % 2 !== 0).length;

  console.log("Количество чисел с нечётным числом цифр:", count);
  rl.close();
});
