import Foundation

/**
    1. Equatable
        - protocol that will help to compare if two values are equal
        - structs will have default implementation for == method which will compare all properties
        - class will have to override the method `static func == (lhs: Self, rhs: Self) -> Bool`
*/

// ------------------- Equatable in Struct -----------------------------------

struct Person: Equatable {
    var name: String
    var address: String
}

let person1 = Person(name: "Peter", address: "NY")
let person2 = Person(name: "Peter", address: "NY")

print(person1 == person2)

// ------------------- Equatable in Class -----------------------------------

class Student: Equatable {
    var name: String
    var marks: Int

    init(name: String, marks: Int) {
        self.name = name
        self.marks = marks
    }

    static func == (lhs: Student, rhs: Student) -> Bool {
        return lhs.name == rhs.name && lhs.marks == rhs.marks
    }
}

let student1 = Student(name: "Peter", marks: 90)
let student2 = Student(name: "Peter", marks: 90)

print(student1 == student2)

/**
    2. Comparable
        - protocol that will help to compare two values with relational operators like <, >, <= and >=
        - we have to implement atleast one of the methods <, >, <= or >=
*/

struct Employee: Comparable {
    var workedHours: Int

    static func < (lhs: Employee, rhs: Employee) -> Bool {
        return lhs.workedHours < rhs.workedHours
    }
}

let emp1 = Employee(workedHours: 10)
let emp2 = Employee(workedHours: 20)

print(emp1 < emp2)

/**
    3. Hashable
        - protocol that will help create a Integer hash value for the object
        - hash values change everytime the program is run, we don't usually use it because of this
        - Elements of Set and and Keys of Dictionary must conform to Hashable protocol
*/

struct Company: Hashable {
    var name: String
    var employeeCount: Int

    func hash(into hasher: inout Hasher) {
        hasher.combine(name) // consider only "name" for calculating hash value
    }
}

let company1 = Company(name: "Google", employeeCount: 2000)
let company2 = Company(name: "Google", employeeCount: 5000)

// since both company1 and company2 have same name "Google", hashvalue will be same for them
print(company1.hashValue)
print(company2.hashValue)

var companySet = Set<Company>() 
var companyDict: [Company: Int] = [:]