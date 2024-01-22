
/**

Generics, Associated Type, Opaque Type

Generics
    Helps us write flexible and reusable code that works with any type.

Associated Type
    are used with protocols when we want to make the protocol more generic / flexible
    when we want the protocol to not depend on any type

Opaque Type
    is used when we want to hide the type of the function that is being returned 
    function returns something but the caller function is not aware of the type
    protocol type will be return from the function


    Note
    Generics is exactly opposite of Opaque Types
*/

// Generics

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}

var a = 5, b = 10
print(a, b)
swapTwoValues(&a, &b)
print(a, b)

// Associated Type

protocol SomeProtocol {
    associatedtype Mytype

    func doSomething(type: Mytype)
    func getSomething() -> Mytype
}

struct SomeStruct1 : SomeProtocol {
    // typealias Mytype = Int

    func doSomething(type: Int) {
        print("doSomething \(type)")
    }

    func getSomething() -> Int {
        return 1
    }
}

struct SomeStruct2 : SomeProtocol {
    // typealias Mytype = String

    func doSomething(type: String) {
        print("doSomething " + type)
    }

    func getSomething() -> String {
        return "hello"
    }
}

let s1 = SomeStruct1()  
let s2 = SomeStruct2()

s1.doSomething(type: 1)
print(s1.getSomething())

s2.doSomething(type: "code")
print(s2.getSomething())

// Associated type example 2 : Stack

protocol Stackable {
    associatedtype Item

    func push(_ item: Item)
    func pop() -> Item?
}

class IntStack : Stackable {
    // typealias Item = Int

    private var data = [Int]()

    func push(_ item: Int) {
        data.append(item)
    }

    func pop() -> Int? {
        return data.popLast()
    }
} 

let intStack = IntStack()
intStack.push(1)
intStack.push(2)
print(intStack.pop())

class StringStack : Stackable {
    // typealias Item = String

    private var data = [String]()

    func push(_ item: String) {
        data.append(item)
    }

    func pop() -> String? {
        return data.popLast()
    }
} 

let stringStack = StringStack()
stringStack.push("item 1")
stringStack.push("item 2")
print(stringStack.pop())

// Opaque type

protocol Shape {
    func draw() -> String
}

struct Circle: Shape {
    func draw() -> String {
        return "Drawing a circle"
    }
}

struct Square: Shape {
    func draw() -> String {
        return "Drawing a square"
    }
}

// Function returning an opaque type
func randomShape() -> some Shape {
    // return Circle()
    return Square()
}

// Usage
let shape = randomShape()
print(shape.draw()) // Output: Either "Drawing a circle" or "Drawing a square"
