import Foundation

func digitSum(_ n: Int) -> Int {
    return String(n).compactMap { Int(String($0)) }.reduce(0, +)
}

func digitProduct(_ n: Int) -> Int {
    return String(n).compactMap { Int(String($0)) }.reduce(1, *)
}

print("Введите числа через пробел:", terminator: " ")
if let input = readLine() {
    let numbers = input.split(separator: " ").compactMap { Int($0) }
    var result: [Int] = []

    for (i, num) in numbers.enumerated() {
        if digitSum(num) < digitProduct(num) {
            result.append(i + 1) // позиция с 1
        }
    }

    print("Номера, где сумма цифр < произведения: \(result.map { String($0) }.joined(separator: " "))")
}
