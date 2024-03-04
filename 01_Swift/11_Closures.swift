
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

// 3. If the closure is the last parameter in the function, use trailing closure syntax
names.filter { name in
    name.hasPrefix("J")
}

// 5. Parameters can be accessed using $0, $1, $2 ..... inside trailing closure
names.filter { $0.hasPrefix("J") }

// ------------------------------------ Trailing Closure ----------------------------------------------------------

func perform(_ a: Int, _ b: Int, _ logic: (_ a: Int, _ b: Int) -> Int) -> Int {
    return logic(a, b)
}

let sum = perform(2, 5) { (a: Int, b: Int) -> Int in
    a + b
}

print(sum)

let sub = perform(2, 5) { (a: Int, b: Int) -> Int in
    a - b
}

print(sub)

let prod = perform(2, 5) { (a: Int, b: Int) -> Int in
    a * b
}

print(prod)

// ---------------------------------------------------------

struct Student {
    let name: String 
    var testScore: Int
}

let students = [
    Student(name: "John", testScore: 88),
    Student(name: "Peter", testScore: 73),
    Student(name: "Kevin", testScore: 95),
    Student(name: "Luffy", testScore: 78),
    Student(name: "Marc", testScore: 65),
    Student(name: "Tony", testScore: 86),
    Student(name: "Bruce", testScore: 68),
]

// find if the student is topper using closure
var topStudentFilter: (Student) -> Bool = { student in
    return student.testScore > 80
}

let topStudents1 = students.filter(topStudentFilter)
print(topStudents1)

// using trailing closure
let topStudents11 = students.filter { student in 
    return student.testScore > 80
}
print(topStudents11)

// find if the student is topper using function
func topStudentFilterFunc(_ student: Student) -> Bool {
    return student.testScore > 80
}

let topStudents2 = students.filter(topStudentFilterFunc)
print(topStudents2)
