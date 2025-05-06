#include <iostream>
#include <vector>
using namespace std;

int digitCount(int n) {
    if (n == 0) return 1;
    int count = 0;
    while (n) {
        n /= 10;
        count++;
    }
    return count;
}

int main() {
    setlocale(LC_ALL, "ru_RU.UTF-8");

    int size;
    cout << "Сколько чисел вы хотите ввести? ";
    cin >> size;

    vector<int> numbers(size);
    cout << "Введите " << size << " чисел через пробел: ";
    for (int i = 0; i < size; ++i) cin >> numbers[i];

    int oddCount = 0;
    for (int num : numbers) {
        if (digitCount(num) % 2 != 0) {
            oddCount++;
        }
    }

    cout << "Количество чисел с нечётным количеством цифр: " << oddCount << endl;
    return 0;
}
