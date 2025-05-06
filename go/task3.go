package main

import (
	"fmt"
)

func digitSum(n int) int {
	sum := 0
	for n != 0 {
		sum += n % 10
		n /= 10
	}
	return sum
}

func digitProduct(n int) int {
	product := 1
	for n != 0 {
		product *= n % 10
		n /= 10
	}
	return product
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

	fmt.Print("Позиции, где сумма цифр < произведения (нумерация с 1): ")
	for i, n := range numbers {
		if digitSum(n) < digitProduct(n) {
			fmt.Printf("%d ", i+1)
		}
	}
	fmt.Println()
}
