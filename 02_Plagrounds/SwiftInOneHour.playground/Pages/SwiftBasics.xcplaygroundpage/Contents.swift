import Cocoa

// ---------------------Strings-----------------------

var s = "name"
s = "s"

let quote = "I said \"This\" is the way"
print(quote)

print(quote.count)

print("quote startes with \"I said\" : \(quote.hasPrefix("I said"))")
print("quote startes with \"Me\" : \(quote.hasPrefix("Me"))")
print("quote ends with \"way\" : \(quote.hasSuffix("way"))")

let multi = """
A day in
the life of
an iOS engineer
"""

// ---------------------Int-----------------------

var count = 10
count += 5

print(count.isMultiple(of: 4))
print(count.isMultiple(of: 5))

// generate random int in range 1,100
let random = Int.random(in: 1 ... 100)

// ---------------------Boolean-----------------------

var isSaved = true
isSaved.toggle()

print(isSaved)

// ---------------------String Interpolation-----------------------

let name = "Karthik"
let age = 24
print("I'm \(name) and I'm \(age) years old.")

// ---------------------Array-----------------------

var colors = ["Red", "Green", "Blue"]
let numbers = [1, 2, 3, 4, 5]
let readings = [0.1, 0.2, 0.3]

colors.append("Yellow")
colors.remove(at: 0)
print(colors.count)

print(colors.contains("Green"))

// ---------------------Dicionary-----------------------

let employee = [
    "name": "John Wick",
    "role": "Assassin"
]

print(employee["role"]) // returns Optional
print(employee["type", default: "Worker"]) // pass default value if value does not exist

var dict: [String: Int] = [:]
dict["count"] = 10

// ---------------------Set-----------------------

var set = Set([1, 1, 2, 2, 3, 3, 3, 4, 5, 5])

set.contains(4) // runs in O(1) time, array takes O(N) time

set.insert(10)
set

set.remove(3)
set

// ---------------------Enums-----------------------

enum Weekday {
    case monday, tuesday, wednesday, thursday, friday
}

var day = Weekday.monday
day = .thursday

// ---------------------Type Annotation-----------------------

let score: Double = 0
let str: String = "hello"
let num: Int = 2
let progress: Float = 45.7
let pi: Double = 3.147
var isEnabled: Bool = true

var movies: [String] = ["Star Wars", "Avengers"]
var collection: [String: Int] = [
    "Star Wars": 1234,
    "Avengers": 2222
]
var books: Set<String> = Set(["Java", "Swift"])

// empty array
var res: [String] = .init()

var dicto: [String: Int] = .init()

// ---------------------Conditionals-----------------------

var age1 = 16

if age1 < 12 {
    print("you can't vote")
} else if age1 < 18 {
    print("you also can't vote")
} else {
    print("yeah! you can vote")
}

// ---------------------Switch-----------------------

enum Weather {
    case sun, rain, wind
}

let forecast = Weather.sun

switch forecast {
case .rain:
    print("Rainy day 🌧️")
case .sun:
    print("Sunny day ☀️")
case .wind:
    print("Windy day 💨")
default:
    print("Don't know 🥲")
}

// ---------------------Loops-----------------------

// ---------for loops------------

let platforms = ["iOS", "macOS", "watchOS", "tvOS"]

for platform in platforms {
    print(platform)
}

// include 5
for i in 1 ... 5 {
    print("i is \(i)")
}

print("--------------")

// exclude 5
for i in 1 ..< 5 {
    print("i is \(i)")
}

print("--------------")

// ignore loop variable
for _ in 1 ... 5 {
    //
}

// ---------while loops------------

var c = 10
while c > 0 {
    c -= 1
}

// ---------------------Functions-----------------------

func printNums(_ num: Int) {
    for i in 1 ... num {
        print(i)
    }
}

printNums(4)

// ---------------------Tuples-----------------------

func getUser() -> (firstName: String, lastName: String, age: Int) {
    return (firstName: "John", lastName: "Wick", age: 45)
}

let user = getUser()
print(user.firstName)

// destructing tuple, take values that we need
let (firstName, _, _) = getUser()
print(firstName)

// ---------------------Function External and Internal Parameter names-----------------------

/*

 func functionName(external_name internal_name: type) -> return_type {}

 ex: printNums(till num: Int) {}

 calling -> printNums(till: 5)
 */

func isUppercase(_ str: String) -> Bool {
    return str == str.uppercased()
}

isUppercase("HELLO")

// ------ default values for parameters

func greet(_ person: String, formal: Bool = true) {
    if formal {
        print("Welcome, \(person)")
    } else {
        print("Hi, \(person)")
    }
}

greet("John")
greet("John", formal: false)

// ---------------------Error handling in Functions-----------------------

enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }

    if password == "12345" {
        throw PasswordError.obvious
    }

    return "OK"
}

do {
    let result = try checkPassword("12345")
} catch PasswordError.obvious {
    print("Password is too obvious")
} catch {
    print(error)
}

// ---------------------Closures-----------------------

let sayHello = {
    print("Hello there!")
}

sayHello()

// closure with parameters

let sayHello2 = { (name: String) -> String in
    "Hello there!, \(name)"
}

sayHello2("John")

let names = ["John", "Walter", "Jesse", "Hardy", "Jake"]

let onlyJ = names.filter { (name: String) -> Bool in
    name.hasPrefix("J")
}

print(onlyJ)

// closures can be simplified by
// 1. removing return keyword if the body is only one line
// 2. Omit parameter type and return types

names.filter { name in
    name.hasPrefix("J")
}

// 3. If the closue is the last parameter in the function, use trailing closure syntax
names.filter { name in
    name.hasPrefix("J")
}

// 5. Parameters can be accessed using $0, $1, $2 ..... inside trailing closure
names.filter { $0.hasPrefix("J") }

// ---------------------Structs-----------------------

struct Album {
    let title: String
    let artist: String
    var isReleased = true

    func printSummary() {
        print("\(title) by \(artist)")
    }

    mutating func removeFromSale() {
        isReleased = false
    }
}

let believer = Album(title: "Believer", artist: "Imagine Dragons")
print(believer.title)
believer.printSummary()

// computed properties: will calculate it's property everytime it is accessed

struct Employee {
    let name: String
    var vacationsAllowed = 14
    var vacationsTaken = 0

    // get only
    var vacationsLeft: Int {
        return vacationsAllowed - vacationsTaken
    }

    // get and set
    var vacationsLeft2: Int {
        get {
            return vacationsAllowed - vacationsTaken
        }
        set {
            vacationsAllowed = vacationsTaken + newValue
        }
    }
}

var e = Employee(name: "John")
e.vacationsLeft2 = 10

// -------- property observers -----------

// didSet - called after the changes have taken place

// willSet - called after the changes will take place

struct Game {
    var score = 0 {
        didSet {
            print("Score updated to : \(score)")
        }
        willSet {
            print("Updating score to : \(newValue)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3

// -------- custom initializers -----------

struct Player {
    let name: String
    let number: Int

    init(name: String) {
        self.name = name
        self.number = Int.random(in: 1 ... 99)
    }
}

// ---------------------Access Control inside Structs-----------------------

// 1. private -> accessible only inside the struct
// 2. private(set) -> others can read it, but only members inside the struct can write it
// 3. fileprivate -> Anything inside the current file can read and write it
// 4. public -> Anyone can read and write

struct BankAccount {
    private let number = Int.random(in: 1000 ... 10000)
    private(set) var funds = 0 // can read from outside struct but cannot set

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if amount > funds {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

let account = BankAccount(funds: 100)

// print(account.number) // cannot access because it is private

print(account.funds) // can read
// account.funds = 2000 // error, cannot write since it is private(set)

// ---------------------Static properties and methods-----------------------

enum AppData {
    static let version = "1.10.2"
}

print(AppData.version)

// ------------------------------------Classes-------------------------------------------------------

class Employeee {
    let hours: Int

    init(hours: Int) {
        self.hours = hours
    }

    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

class Developer: Employeee {
    func work() {
        print("I'm coding for \(hours) hours a day.")
    }

    override func printSummary() {
        print("I'm a developer and I code for \(hours) hours a day.")
    }
}

let dev = Developer(hours: 8)
dev.work()
dev.printSummary()

// ---------- initializers in class ---------
// class will not have a default initializer, struct will have one.

class Vehicle {
    let isElectric: Bool

    init(_ isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertibe: Bool

    init(isElectric: Bool, isConvertibe: Bool) {
        self.isConvertibe = isConvertibe
        super.init(isElectric)
    }
}

// classes are pass by reference
// if both objects are equal, modifying one object will modify others as well

class Actor {
    var name = "Chris Pratt"
}

var actor1 = Actor()
var actor2 = actor1

print(actor1.name, actor2.name)
actor1.name = "Robert Downey Jr."
print(actor1.name, actor2.name)

/*
 Difference between structs and classes as mentioned above
    1. class will not have a default initializer with its member variables, struct will have one
    2. classes are pass by reference, if both objects are equal, modifying one object will modify others as well. In structs modifying one will not change the other.
    3. Class will have access deinit{} method which will be called when the object is destoyed, structs do not have access to deinit {}.
    4. Classes let us change properties of the instance even if the instance is a constact, struct will not allow this
 */

class Site {
    let id: Int

    init(id: Int) {
        self.id = id
        print("Site \(id): created")
    }

    deinit {
        print("Site \(id): destroyed")
    }
}

// this will not call destroy, use it in a loop / block of code since the scope will be inside that block and it will be destroyed after that block
let site = Site(id: 1)
print("Site \(site.id) accessed")

print()

for i in 1 ... 3 {
    let site = Site(id: i)
    print("Site \(site.id) accessed")
}

// ---------------------Protocols-----------------------

protocol VehicleProtocol {
    var name: String { get } // can be a read only variable / computed property
    var currentPassengers: Int { get set } // can be a read & write variable / computed property

    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Bike: VehicleProtocol {
    var name = "MT-15"
    var currentPassengers = 1

    func estimateTime(for distance: Int) -> Int {
        distance / 70
    }

    func travel(distance: Int) {
        print("Riding \(distance) km")
    }

    func openSeat() {
        print("Seat opened")
    }
}

func commute(distance: Int, using vehicle: VehicleProtocol) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("Too slow")
    } else {
        vehicle.travel(distance: distance)
    }
}

let bike = Bike()
commute(distance: 100, using: bike)

// ---------------------Extensions-----------------------

extension String {
    func trimmed() -> String {
        trimmingCharacters(in: .whitespacesAndNewlines)
    }

    // modify in-place instead of returning
    mutating func trim() {
        self = trimmed()
    }
    
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

print("    hello     ".trimmed())

print("""
abc
def
ghi
jkl
""".lines)

// ---------------------Protocol Extensions-----------------------

extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

print([1, 2, 3].isNotEmpty)

// ---------------------Optional-----------------------

let opposites = [
    "Mario": "Wario",
    "Luigi": "WaLuigi"
]

let peachOpposite = opposites["Peach"] // returns Optional() because it may not exist in the dictionary

// Unwrapping optionals

// 1. if let

if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}

// does nothing because opposites["Peach"] is nil
if let peachOpposite2 = opposites["Peach"] {
    print("Peach's opposite is \(peachOpposite2)")
}

// 2. guard let
//    similar ro if let but 
//    if let runs the code inside the block if the Optional is not nil
//    guard let runs the code inside the block if the Optional is nil

func printSquare(of num: Int?) {
    guard let num = num else {
        print("Missing number 'n'")
        return
    }
    print("Square of \(num) = \(num * num)")
}

var n1: Int? = 10
n1 = nil
printSquare(of: n1)

// 3. Nil Coalescing Operator (??)

let input = ""
let inputNum = Int(input) ?? 0
print(inputNum)

// 4. Optional chaining methods / variables (?.)

let tvShows = ["Arrow", "Prison Break", "Breaking Bad"]
let favorite = tvShows.randomElement()?.uppercased() ?? "None"
print(favorite)

// 4. Optional try

enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 20) {
    print("User: \(user)")
}
