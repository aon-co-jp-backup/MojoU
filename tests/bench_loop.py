def collatz_total(limit: int) -> int:
    total = 0
    for n in range(1, limit):
        x = n
        while x != 1:
            if x % 2 == 0:
                x = x // 2
            else:
                x = 3 * x + 1
            total += 1
    return total

def main():
    print(collatz_total(300000))
