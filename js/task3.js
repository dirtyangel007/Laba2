const readline = require("readline");

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function digitSum(n) {
  return n.toString().split('').reduce((acc, d) => acc + parseInt(d), 0);
}

function digitProduct(n) {
  return n.toString().split('').reduce((acc, d) => acc * parseInt(d), 1);
}

rl.question("Введите числа через пробел: ", (input) => {
  const nums = input.trim().split(" ").map(Number);
  let result = [];

  nums.forEach((num, index) => {
    if (digitSum(num) < digitProduct(num)) {
      result.push(index + 1); // позиции с 1
    }
  });

  console.log("Номера, где сумма цифр < произведения:", result.join(" "));
  rl.close();
});
