G = 10
total: int = 0

def fib(n: int) -> int:
    return n if n < 2 else fib(n - 1) + fib(n - 2)

def collatz(n):
    steps = 0
    while n != 1:
        if n % 2 == 0:
            n = n // 2
        else:
            n = 3 * n + 1
        steps += 1
    return steps

def gcd(a, b):
    while b:
        a, b = b, a % b
    return a

def main():
    print(fib(20), collatz(27), G * 2)
    s = 0
    for i in range(1, 101):
        if i % 3 == 0 or i % 5 == 0:
            s += i
        if i > 90:
            break
    print(s)
    print(7 // 2, -7 // 2, 7 % -3, -7 % 3, 2 ** 10, 7 / 2, 2 ** -1)
    print(1.5 + 2, 3 * 0.1, abs(-4), min(3, 1, 2), max(2.5, 1))
    print("a" + "b", len("héllo"), str(12) + "x", int("42") + 1, float("1.5"))
    print(1 < 2 < 3, 1 < 3 < 2, not 0, True and 5, 0 or "z")
    for j in range(10, 0, -3):
        print(j)
    x = 5
    while x > 0:
        x -= 2
        if x == 1:
            continue
        print(x)
