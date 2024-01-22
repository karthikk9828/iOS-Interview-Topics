//: [Previous](@previous)

import Foundation

func fib(_ n: Int) -> Int {
    // uses formula instead of recursion
    // f(n) = 1/sqrt(5) * ( ((1 + sqrt(5)) / 2) - ((1 - sqrt(5)) / 2) )
    
    let a = 1 / sqrt(5)
    let b = (1 + sqrt(5)) / 2
    let c = (1 - sqrt(5)) / 2
    
    let result = a * ( pow(b, Double(n))  - pow(c, Double(n)) )
    
    return  Int(result)
}

print(fib(50))


"1.1.1.1".replacingOccurrences(of: ".", with: "[.]")

//: [Next](@next)
