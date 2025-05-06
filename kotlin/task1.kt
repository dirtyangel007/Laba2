fun main() {
    print("Введите число: ")
    val n = readLine()!!.toInt()
    val start = 'A' + (n - 1)

    for (i in 1..n) {
        var line = ""
        for (j in 0 until i) {
            line += (start - j)
        }
        println(line)
    }
}
