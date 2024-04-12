
import Foundation

/**
    A key path in Swift is a way to reference a property, or a series of properties, of a type in a type-safe manner. 
    It allows you to refer to properties by name, enabling you to access, set, or observe them dynamically, 
    without knowing the specific instance they belong to at compile time.

    Key paths are represented by the KeyPath type in Swift. 
    
    There are two main kinds of key paths:

    1. Writable Key Paths: 
        These key paths allow both reading and writing to the underlying property or properties.

    2. Read-only Key Paths: 
        These key paths only allow reading from the underlying property or properties.
*/

struct Person {
    var name: String
    var age: Int
}

let john = Person(name: "John", age: 30)

// Define a key path to the 'name' property of the Person struct
let nameKeyPath = \Person.name

// Access the value of the 'name' property using the key path
let name = john[keyPath: nameKeyPath] // Equivalent to john.name
print(name)

// You can also use the key path directly with functions like map or sorted
let people = [Person(name: "Alice", age: 25), Person(name: "Bob", age: 35)]
let names = people.map { $0[keyPath: nameKeyPath] } // ["Alice", "Bob"]

