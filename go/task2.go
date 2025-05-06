package main

import (
	"fmt"
)

func digitCount(n int) int {
	if n == 0 {
		return 1
	}
	count := 0
	for n != 0 {
		n /= 10
		count++
	}
	return count
}

func main() {
	var size int
	fmt.Print("Сколько чисел вы хотите ввести? ")
	fmt.Scan(&size)

	numbers := make([]int, size)
	fmt.Println("Введите", size, "чисел через пробел:")
	for i := 0; i < size; i++ {
		fmt.Scan(&numbers[i])
	}

	count := 0
	for _, n := range numbers {
		if digitCount(n)%2 != 0 {
			count++
		}
	}

	fmt.Println("Количество чисел с нечётным количеством цифр:", count)
}
