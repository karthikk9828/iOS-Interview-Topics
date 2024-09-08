
/**

    AnyObject 
        is a protocol that represents an instance of any class type. 
        It is used when you want to work with values of any class type, including class instances and class types themselves.

        var anyObjectArray: [AnyObject] = [UIButton(), UILabel(), UIView()]
    
    Any 
        is a protocol that represents an instance of any type, including class types, structure types, enumerations, and protocols.

        var anyArray: [Any] = [5, "Hello", UIView(), true]

    any
        same as Any, determines the type at runtime, check example

    Refer:
        https://www.avanderlee.com/swift/anyobject-any/
*/

var object: AnyObject
object = "This is a string" as AnyObject

var value: Any
value = 42
value = "This is a string"

class Test {
    let a = 10
}
let test = Test()
let a: [Any] = ["hello", 1.2, true, 10, test]
print(a)

var b: any
b = 2

// -------------------------- any ------------------------------------

protocol NetworkServicer {
    func fetchUserName() -> String 
}

class ViewModel {
    var userName: String?
    private var service: any NetworkServicer

    init(service: any NetworkServicer) {
        self.service = service
    }

    func fetchData() {
        Task {
            userName = await service.fetchUserName()
        }
    }
}