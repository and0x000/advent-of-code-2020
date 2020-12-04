lines = open('input').readlines()

# input conversion
lines = map(lambda x: x.strip(), lines)
lines = filter(lambda x: x != '', lines)
lines = list(map(lambda x: int(x), lines))

# force result
for line1 in lines:
    for line2 in lines:
        if line1 + line2 == 2020:
            print('part 1: %s', line1 * line2 * line3)
        for line3 in lines:
            if line1 + line2 + line3 == 2020:
                print('part 2: %s', line1 * line2 * line3)
