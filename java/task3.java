import java.util.Scanner;

public class task3 {
    public static int digitSum(int n) {
        int sum = 0;
        while (n > 0) {
            sum += n % 10;
            n /= 10;
        }
        return sum;
    }

    public static int digitProduct(int n) {
        int product = 1;
        while (n > 0) {
            product *= n % 10;
            n /= 10;
        }
        return product;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Введите числа через пробел: ");
        String[] input = sc.nextLine().split(" ");

        System.out.print("Номера, где сумма цифр < произведения: ");
        for (int i = 0; i < input.length; i++) {
            int num = Integer.parseInt(input[i]);
            if (digitSum(num) < digitProduct(num)) {
                System.out.print((i + 1) + " ");
            }
        }
        System.out.println();
    }
}
