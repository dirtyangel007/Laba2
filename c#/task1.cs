using System;

class Task1 {
    static void Main() {
        Console.Write("Введите число: ");
        int n = int.Parse(Console.ReadLine());

        char start = (char)('A' + n - 1);

        for (int i = 1; i <= n; i++) {
            for (char c = start; c >= start - (i - 1); c--) {
                Console.Write(c);
            }
            Console.WriteLine();
        }
    }
}
