import UIKit

var a = 5, b = 8

var temp = a
a = b
b = temp

print("The value of a is \(a)")
print("The value of b is \(b)")

var numbers = [45, 73, 195, 53]

let result = [
    numbers[0] * numbers[1],
    numbers[1] * numbers[2],
    numbers[2] * numbers[3],
    numbers[3] * numbers[0],
]

print(result)

// Range operator (lower and upper inclusive)
print(Int.random(in: 1 ... 10))

// Range operator (lower inclusive and upper exclusive)
print(Int.random(in: 1 ..< 10))

// ---------------- Functions ----------------
func helloWorld() {
    print("hello world")
}

helloWorld()

// ---------------- Structures ----------------

struct Town {
    let name: String
    var citizens: [String]
    var resources: [String: Int]

    init(name: String, citizens: [String], resources: [String: Int]) {
        self.name = name
        self.citizens = citizens
        self.resources = resources
    }

    func fortify() {
        print("Defences increased!")
    }
}

var town = Town(name: "Vegas", citizens: ["Jack", "Peter"], resources: ["Grains": 100, "Ore": 45, "Wool": 70])

print(town)
town.fortify()

struct User {
    let name: String
    let email: String?
    let followers: Int
    var isActive: Bool

    init(name: String, email: String?, followers: Int, isActive: Bool) {
        self.name = name
        self.email = email
        self.followers = followers
        self.isActive = isActive
    }

    func logStatus() {
        if self.isActive {
            print("\(self.name) is working hard")
        }
        else {
            print("\(self.name) has left earth")
        }
    }
}

var user = User(name: "Richard", email: "richard@gmail.com", followers: 0, isActive: false)
user.logStatus()

// ---------------- Extensions ----------------

extension Double {
    func round(to places: Int) -> Double {
        let precision = pow(10, Double(places))
        var n = self
        n = n * precision
        n.round()
        n = n / precision
        return n
    }
}

var val = 3.14159

val.round(to: 1)
val.round(to: 2)
val.round(to: 3)
val.round(to: 4)
