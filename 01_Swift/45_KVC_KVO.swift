
import Foundation

/**
    Key Value Coding (KVC)
        - is a mechanism for accessing an object's properties indirectly, using strings to identify properties
          rather than accessing them directly using instance properties or methods
        - classes have to extend NSObject to have access to value(forkey: "") 
        - property has to be annotated with `@objc` and `dynamic`

    Key Value Observing (KVO)
        we observe the change in the values of the properties
*/

// ----------------------------Key Value Coding (KVC)----------------------------------

class Person: NSObject {
    @objc dynamic var name: String
    
    init(name: String) {
        self.name = name
    }
}

let person = Person(name: "John")

let name1 = person.name
let name2 = person.value(forKey: "name") ?? ""

print("name through property: \(name1)")
print("name through KVC: \(name2)")

// ----------------------------Key Value Observing (KVO)----------------------------------

class User: NSObject {
    @objc dynamic var name: String
    
    init(name: String) {
        self.name = name
    }
}

let user = User(name: "Thor")

// store the result in a reference variable for this to work
let observer = user.observe(\User.name, options: [.old, .new]) { person, value in
    print("KVO old value: \(value.oldValue)")
    print("KVO new value: \(value.newValue)")
}

user.name = "Loki"