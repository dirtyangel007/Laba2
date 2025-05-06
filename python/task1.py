N = int(input("Введите число: "))
start_char = ord('A') + N - 1

for i in range(1, N + 1):
    line = ""
    for j in range(i):
        line += chr(start_char - j)
    print(line)
