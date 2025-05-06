#include <iostream>
#include <vector>
using namespace std;

int digitSum(int n) {
    int sum = 0;
    while (n) {
        sum += n % 10;
        n /= 10;
    }
    return sum;
}

int digitProduct(int n) {
    int product = 1;
    while (n) {
        product *= n % 10;
        n /= 10;
    }
    return product;
}

int main() {
    setlocale(LC_ALL, "ru_RU.UTF-8");

    int size;
    cout << "Сколько чисел вы хотите ввести? ";
    cin >> size;

    vector<int> numbers(size);
    cout << "Введите " << size << " чисел через пробел: ";
    for (int i = 0; i < size; ++i) cin >> numbers[i];

    cout << "Позиции чисел, где сумма цифр меньше произведения (нумерация с 1): ";
    for (int i = 0; i < size; ++i) {
        if (digitSum(numbers[i]) < digitProduct(numbers[i])) {
            cout << i + 1 << " ";
        }
    }
    cout << endl;

    return 0;
}
