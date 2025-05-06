<?php
echo "Введите число: ";
$line = trim(fgets(STDIN));
$n = intval($line);

$start = ord('A') + $n - 1;

for ($i = 1; $i <= $n; $i++) {
    $row = "";
    for ($j = 0; $j < $i; $j++) {
        $row .= chr($start - $j);
    }
    echo $row . PHP_EOL;
}
