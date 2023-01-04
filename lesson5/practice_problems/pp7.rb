a = 2
b = [5, 8]
arr = [a, b]

# reassigns arr[0], doesn't affect a
arr[0] += 2
# mutates object referred to by arr[1], which is the same
# as the object reffered to by b, so this does change b
arr[1][0] -= a

# result is a = 2, b = [3, 8]
p a
p b