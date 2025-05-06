use std::io;

fn count_odd_digit_numbers(numbers: Vec<i32>) -> usize {
    numbers.iter().filter(|&&x| x.to_string().len() % 2 != 0).count()
}

fn main() {
    println!("Введите числа через пробел:");
    let mut input = String::new();
    io::stdin().read_line(&mut input).unwrap();

    let nums: Vec<i32> = input.trim()
        .split_whitespace()
        .map(|s| s.parse().unwrap())
        .collect();

    let result = count_odd_digit_numbers(nums);
    println!("Количество чисел с нечётным числом цифр: {}", result);
}
