import java.util.Scanner;

public class task2 {
    public static int countDigits(int num) {
        return Integer.toString(Math.abs(num)).length();
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Введите числа через пробел: ");
        String[] input = sc.nextLine().split(" ");
        int count = 0;

        for (String s : input) {
            int num = Integer.parseInt(s);
            if (countDigits(num) % 2 != 0) {
                count++;
            }
        }

        System.out.println("Количество чисел с нечётным числом цифр: " + count);
    }
}
