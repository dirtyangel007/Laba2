fun countDigits(num: Int): Int = if (num == 0) 1 else num.toString().length

fun main() {
    print("Введите числа через пробел: ")
    val numbers = readLine()!!.split(" ").map { it.toInt() }

    val count = numbers.count { countDigits(it) % 2 != 0 }
    println("Количество чисел с нечётным числом цифр: $count")
}
