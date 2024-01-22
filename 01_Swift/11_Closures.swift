
func perform(_ a: Int, _ b: Int, _ logic: (_ a: Int, _ b: Int) -> Int) -> Int {
    return logic(a, b)
}

let sum = perform(2, 5) { (a: Int, b: Int) -> Int in
    a + b
}

print(sum)

let sub = perform(2, 5) { (a: Int, b: Int) -> Int in
    a - b
}

print(sub)

let prod = perform(2, 5) { (a: Int, b: Int) -> Int in
    a * b
}

print(prod)
