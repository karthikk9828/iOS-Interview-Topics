

/**
    To fix retain cycles

    1. Use struct instead of class because structs are value types, but we cannot access deinit in structs
    2. Make one reference weak, whichever we know will be de-allocated first
       School in the below example, it has to be optional because ARC will set it to nil later
*/

class School {
    private var students = [Student]()

    func addStudent(student: Student) {
        students.append(student)
    }

    deinit {
        print("School deinitialized")
    }
}

class Student {
    private weak var school: School?

    required init(school: School) {
        self.school = school
    }

    deinit {
        print("Student deinitialized")
    }
}

let school = School()
let student = Student(school: school)

school.addStudent(student: student)

// Retain cycle in closures

class SomeClass {
    private var count = 0

    private var closure: () -> () = {}

    init() {
        closure = {[weak self] in
            guard let self = self else { return }
            self.count = self.count + 1
        }
    }

    deinit {
        print("SomeClass deinitialized")
    }
}

var cl: SomeClass? = SomeClass()

cl = nil

// make only classes conform to protocol by adding : class after delegate name

// protocol VCDelegate : class {
//     func setup()
// }

// // works
// class VC: VCDelegate {
//     func setup() {}
// }

// // does not work
// struct VCS: VCDelegate {
//     func setup() {}
// }
