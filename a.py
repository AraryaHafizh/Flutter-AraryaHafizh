def factor(num):
    factors = []
    for i in range(1, num):
        if num % i == 0:
            factors.append(i)
    print(factors)


factor(24)
