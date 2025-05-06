import java.util.Scanner;

public class task1 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Введите число: ");
        int n = sc.nextInt();
        char start = (char) ('A' + (n - 1));

        for (int i = 1; i <= n; i++) {
            StringBuilder line = new StringBuilder();
            for (int j = 0; j < i; j++) {
                line.append((char)(start - j));
            }
            System.out.println(line);
        }
    }
}
