
import Foundation

struct User {
    let name: String
    let age: Int?
}

let user = User(name: "John", age: 44)

// ------- If Let -------

if let age = user.age {
    print("if let: Age is \(age) years.")
} else {
    print("if let: No age given.")
}

// ------- Guard let -------

func checkAge(age: Int?) {
    guard let age = age else {
        print("guard let: No age given.")
        return
    }

    if age > 40 {
        print("guard let: Old")
    }
}

checkAge(age: user.age)

// ------- Nil coalescing (??) -------

let age = user.age ?? 0
print("Nil coalescing: Age is \(age) years.")

// ------- Force unwrap (!) -------

// let age2 = user.age!
// print("Force unwrap: Age is \(age2) years.")

// ------- Optional chaining -------

let user2: User? = User(name: "Peter", age: nil)
print(user2?.age)
