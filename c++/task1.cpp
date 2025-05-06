#include <iostream>
#include <string>
using namespace std;

int main() {
    int N;
    cout << "Введите число: ";
    cin >> N;

    char start = 'A' + (N - 1); // Вычисляем начальный символ

    for (int i = 1; i <= N; i++) {
        string str = "";
        for (char j = start; j >= (start - (i - 1)); j--) {
            str += j;
        }
        cout << str << endl;
    }

    return 0;
}