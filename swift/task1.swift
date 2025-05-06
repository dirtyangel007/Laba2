import Foundation

print("Введите число:", terminator: " ")
if let input = readLine(), let n = Int(input) {
    let startChar = Character(UnicodeScalar(65 + n - 1)!) // 65 = "A"

    for i in 1...n {
        var line = ""
        for j in 0..<i {
            if let scalar = startChar.unicodeScalars.first?.value {
                line += String(UnicodeScalar(scalar - UInt32(j))!)
            }
        }
        print(line)
    }
}
