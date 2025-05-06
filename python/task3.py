nums = list(map(int, input("Введите числа через пробел: ").split()))

def digit_sum(n):
    return sum(int(d) for d in str(n))

def digit_product(n):
    result = 1
    for d in str(n):
        result *= int(d)
    return result

print("Номера подходящих чисел:", end=" ")
for i, num in enumerate(nums, start=1):
    if digit_sum(num) < digit_product(num):
        print(i, end=" ")
print()
