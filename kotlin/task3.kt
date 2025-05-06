fun digitSum(n: Int): Int = n.toString().map { it.digitToInt() }.sum()

fun digitProduct(n: Int): Int = n.toString().map { it.digitToInt() }.reduce { acc, d -> acc * d }

fun main() {
    print("Введите последовательность чисел через пробел: ")
    val nums = readLine()!!.split(" ").map { it.toInt() }

    print("Номера, где сумма цифр < произведения: ")
    for ((index, num) in nums.withIndex()) {
        if (digitSum(num) < digitProduct(num)) {
            print("${index + 1} ")
        }
    }
    println()
}
