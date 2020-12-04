lines = open('input').readlines()

# input conversion
lines = map(lambda x: x.strip(), lines)
lines = filter(lambda x: x != '', lines)
lines = list(map(lambda x: int(x), lines))

# force result
for line1 in lines:
    for line2 in lines:
        if line1 + line2 == 2020:
            print(line1 * line2)
