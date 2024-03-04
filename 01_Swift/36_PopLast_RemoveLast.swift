
import Foundation

/**
    popLast<T>() -> T?
        Return an Optional Value. If the array is empty, it returns nil

    removeLast() -> T
        Return a Concrete Value. If the array is empty, it results in an fatalError.
*/

var a: [Int] = [1, 2]
print(a.popLast()) // Optional(2)
print(a.popLast()) // Optional(1)
print(a.popLast()) // nil

var b: [Int] = [1, 2]
print(b.removeLast()) // Optional(2)
print(b.removeLast()) // Optional(1)
print(b.removeLast()) // Error