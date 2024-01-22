
class Company {
    weak var employee: Employee?

    deinit {
        print("Company deinitialized")
    }
}

class Employee {
    var company: Company?

    deinit {
        print("Employee deinitialized")
    }
}

var company: Company? = Company()
var employee: Employee? = Employee()

company!.employee = employee
employee!.company = company

employee = nil
company = nil
