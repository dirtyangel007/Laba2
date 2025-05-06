import * as readline from "readline";

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

rl.question("Введите число: ", (input) => {
  const n = parseInt(input);
  const start = 'A'.charCodeAt(0) + n - 1;

  for (let i = 1; i <= n; i++) {
    let row = "";
    for (let j = 0; j < i; j++) {
      row += String.fromCharCode(start - j);
    }
    console.log(row);
  }

  rl.close();
});
