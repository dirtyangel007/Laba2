import Foundation

print("Введите числа через пробел:", terminator: " ")
if let line = readLine() {
    let numbers = line.split(separator: " ").compactMap { Int($0) }
    let count = numbers.filter { String($0).count % 2 != 0 }.count
    print("Количество чисел с нечётным числом цифр: \(count)")
}
