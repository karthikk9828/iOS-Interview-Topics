
import Foundation

class MyClass {
    
    // Instance property
    var instanceProperty: Int
    
    // Class method
    class func classMethod() {
        print("This is a class method.")
    }
    
    // Initializer
    init(instanceProperty: Int) {
        self.instanceProperty = instanceProperty
    }
}

MyClass.classMethod()


// LinkedList

public class Node<Value> {

  public var value: Value
  public var next: Node?
  
  public init(value: Value, next: Node? = nil) {
    self.value = value
    self.next = next
  }
}

let node1 = Node<Int>(value: 1)
let node2 = Node<Int>(value: 2)
let node3 = Node<Int>(value: 3)
let node4 = Node<Int>(value: 4)

var head: Node? = node1
node1.next = node2
node2.next = node3
node3.next = node4

// print(node1.value)

var current = head 
while current != nil {
    print(current!.value)
    current = current!.next
}

func printInReverse(_ node: Node<Int>?) {
    if node == nil {
        return
    }
    printInReverse(node!.next)
    print(node!.value)
}

printInReverse(head)

struct Tutorial {
  var difficulty: Int = 1
}

var tutorial1 = Tutorial()
var tutorial2 = tutorial1
tutorial2.difficulty = 2

print(tutorial1.difficulty)
print(tutorial2.difficulty)

// simplify this closure
var animals = ["fish", "cat", "chicken", "dog"]
animals.sort { (one: String, two: String) -> Bool in
    return one < two
}
print(animals)

// we can ignore the types
animals.sort { (one, two) in
    return one < two
}

// we can ignore the parameter names
animals.sort { 
    return $0 < $1
}

// we can ignore the return keyword since the code is only one line
animals.sort { $0 < $1 }

struct MyIntegerType: ExpressibleByIntegerLiteral {
    // typealias IntegerLiteralType = Int

    let value: Int

    init(integerLiteral value: Int) {
        self.value = value
    }
}

// Now you can initialize MyIntegerType using integer literals
let myInt: MyIntegerType = 42
print(myInt.value) // Output: 42
