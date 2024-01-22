
class Employee {
    private var name: String

    init(name: String) {
        self.name = name
    }

    func getDetails() {
        print("Name is \(name)")
    }
}

class FrontEndDeveloper: Employee {
    func getFrontEndSkills() {
        print("HTML, CSS, Javascript")
    }
}

class BackEndDeveloper: Employee {
    func getBackFrontEndSkills() {
        print("Node.js, Javascript, Python")
    }
}

// this multiple inheritence will not work
class FullStackDeveloper: Employee, FrontEndDeveloper, BackEndDeveloper {
    func getFullStackSkills() {
        print("HTML, JQuery, Node.js, Javascript, Python")
    }
}

// --------- run by selelcting below or above part only -------------

class Employee {
    private var name: String

    init(name: String) {
        self.name = name
    }

    func getDetails() {
        print("Name is \(name)")
    }
}

protocol FrontEndDeveloperSkills {}
protocol BackEndDeveloperSkills {}
protocol FullStackDeveloperSkills {}

// add default method behaviour inside protocol extension, extension on protocols can also have computed properties, cannot have stored properties

extension FrontEndDeveloperSkills {
    func getFrontEndSkills() {
        print("HTML, CSS, Javascript")
    }
}

extension BackEndDeveloperSkills {
    func getBackFrontEndSkills() {
        print("Node.js, Javascript, Python")
    }
}

extension FullStackDeveloperSkills {
    func getFullStackSkills() {
        print("HTML, JQuery, Node.js, Javascript, Python")
    }
}

class FrontEndDeveloper: Employee, FrontEndDeveloperSkills {}
class BackEndDeveloper: Employee, BackEndDeveloperSkills {}
class FullStackDeveloper: Employee, FrontEndDeveloperSkills, BackEndDeveloperSkills, FullStackDeveloperSkills {}

var fullstackEmployee = FullStackDeveloper(name: "John")
fullstackEmployee.getDetails()
fullstackEmployee.getFrontEndSkills()
fullstackEmployee.getBackFrontEndSkills()
fullstackEmployee.getFullStackSkills()

protocol A {
    var a : Int  { get }
}

class My : A {
    var a: Int {
        get {
            return 10
        }

        set {
            print("set")
        }
    }
}

let my = My()
print(my.a)
my.a = 12
print(my.a)
