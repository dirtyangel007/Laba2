using System;
using System.Linq;

class Task3 {
    static int DigitSum(int n) {
        return n.ToString().Sum(c => c - '0');
    }

    static int DigitProduct(int n) {
        return n.ToString().Aggregate(1, (prod, c) => prod * (c - '0'));
    }

    static void Main() {
        Console.Write("Введите числа через пробел: ");
        var numbers = Console.ReadLine().Split().Select(int.Parse).ToList();

        Console.Write("Номера подходящих чисел: ");
        for (int i = 0; i < numbers.Count; i++) {
            int num = numbers[i];
            if (DigitSum(num) < DigitProduct(num)) {
                Console.Write((i + 1) + " ");
            }
        }
        Console.WriteLine();
    }
}
