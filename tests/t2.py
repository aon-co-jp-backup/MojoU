def is_prime(n):
    if n < 2:
        return False
    i = 2
    while i * i <= n:
        if n % i == 0:
            return False
        i += 1
    return True

def sum_to(n: int) -> int:
    t = 0
    for i in range(n):
        t += i
    return t

def main():
    c = 0
    for k in range(2, 2000):
        if is_prime(k):
            c += 1
    print(c, sum_to(100000))
    a, b = 3, 4
    a, b = b, a
    print(a, b, 10 ** 18, 0.1 + 0.2, 1e22, 1.5e-7, 100.0, 2 / 3)
    print(True + 1, "x" < "y", 3 == 3.0, "ok")
