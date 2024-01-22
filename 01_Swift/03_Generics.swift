
// Generic function to add two numbers

// T should conform to Numeric protocol

func add<T: Numeric>(a: T, b: T) -> T {
    return a + b
}
print(add(a: 1, b: 2))
print(add(a: 5.78, b: 12.89))

// we can also conform to Numeric protocol as below

func sum<T>(a: T, b: T) -> T where T : Numeric {
    return a + b
}

print(sum(a: 1, b: 2))
print(sum(a: 5.78, b: 12.89))
