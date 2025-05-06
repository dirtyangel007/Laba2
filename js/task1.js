const readline = require("readline");

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.question("Введите число: ", (input) => {
  const n = parseInt(input);
  const start = String.fromCharCode('A'.charCodeAt(0) + n - 1);

  for (let i = 1; i <= n; i++) {
    let line = '';
    for (let j = 0; j < i; j++) {
      line += String.fromCharCode(start.charCodeAt(0) - j);
    }
    console.log(line);
  }

  rl.close();
});
