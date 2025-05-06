package main

import (
	"fmt"
)

func main() {
	var N int
	fmt.Print("Введите число: ")
	fmt.Scan(&N)

	for i := 1; i <= N; i++ {
		startChar := 'A' + rune(N-1)
		for ch := startChar; ch >= startChar-rune(i-1); ch-- {
			fmt.Printf("%c", ch)
		}
		fmt.Println()
	}
}
