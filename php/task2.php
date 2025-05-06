<?php
echo "Введите числа через пробел: ";
$input = trim(fgets(STDIN));
$numbers = explode(" ", $input);

$count = 0;
foreach ($numbers as $num) {
    if (strlen(strval(abs(intval($num)))) % 2 != 0) {
        $count++;
    }
}

echo "Количество чисел с нечётным числом цифр: $count\n";
