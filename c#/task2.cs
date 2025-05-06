using System;
using System.Linq;

class Task2 {
    static int CountDigits(int n) {
        return n.ToString().Length;
    }

    static void Main() {
        Console.Write("Введите числа через пробел: ");
        var numbers = Console.ReadLine().Split().Select(int.Parse).ToList();

        int count = numbers.Count(n => CountDigits(Math.Abs(n)) % 2 != 0);
        Console.WriteLine("Количество чисел с нечётным количеством цифр: " + count);
    }
}
