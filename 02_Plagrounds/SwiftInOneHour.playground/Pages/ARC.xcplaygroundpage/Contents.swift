//: [Previous](@previous)

/**
 Automatic Reference Counting (ARC)
 https://docs.swift.org/swift-book/documentation/the-swift-programming-language/automaticreferencecounting
 */

import Foundation

class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }

    deinit {
        print("\(name) is being deinitialized")
    }
}

var p1: Person?
var p2: Person?
weak var p3: Person?

p1 = Person(name: "John") // Prints "John is being initialized"
p2 = p1
p3 = p1

/**
 There are now three strong references to this single Person instance.

 If you break two of these strong references (including the original reference) by assigning nil to two of the variables, a single strong reference remains, and the Person instance isn’t deallocated:
 */
p1 = nil
p2 = nil

/**
 ARC doesn’t deallocate the Person instance until the third and final strong reference is broken, at which point it’s clear that you are no longer using the Person instance:
 */
p3 = nil // Prints "John is being deinitialized"

// ----------------------------- Strong Reference Cycles Between Class Instances -------------------------------

class Person_ {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment_?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment_ {
    let unit: String
    init(unit: String) { self.unit = unit }
    var tenant: Person_?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

var john: Person_?
var unit4A: Apartment_?

john = Person_(name: "John Appleseed")
unit4A = Apartment_(unit: "4A")

john!.apartment = unit4A
unit4A!.tenant = john

// Strong reference cycles in clousre
// when a close is a class property and inside the closure we access another class property
// this creates a strong reference to eachother
class HTMLElement {
    let name: String
    let text: String?

    lazy var asHTML: () -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }

    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }

    deinit {
        print("\(name) is being deinitialized")
    }
}

let heading = HTMLElement(name: "h1")
let defaultText = "some default text"
heading.asHTML = {
    "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
}

print(heading.asHTML()) // Prints "<h1>some default text</h1>"

//: [Next](@next)

enum SomeEnum {
    case a, b, c
}

// print(SomeEnum.allCases) // error : did not conform to CaseIterable protocol

enum SomeEnum1: CaseIterable {
    case a, b, c
}

print(SomeEnum1.allCases)

for item in SomeEnum1.allCases {
    print(item.self)
}


var myObject: AnyObject

var myValue: Any

func processValue(value: any <#type#>) {
    // code to process the value
}

var arr = ["1", 2, true] as [Any]


