
import Foundation

/**
    Identity operator (===) return true if both values point to the same object / reference
*/

class Person: Equatable {
    var name: String
    init(_ name: String) {
        self.name = name
    }

    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name
    }
}

let person1 = Person("IronMan")
let person2 = Person("IronMan")

print(person1 == person2) // true, values are equal
print(person1 === person2) // false, references are different

let person3 = Person("Thor")
let person4 = person3

print(person3 == person4) // true, values are equal
print(person3 === person4) // true, references are same