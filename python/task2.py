nums = list(map(int, input("Введите числа через пробел: ").split()))

def count_digits(n):
    return len(str(abs(n)))  # abs на случай отрицательных чисел

count = sum(1 for num in nums if count_digits(num) % 2 != 0)

print("Количество чисел с нечётным количеством цифр:", count)
