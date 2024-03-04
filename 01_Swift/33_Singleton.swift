
import Foundation

/**
    Singleton is an instance of a class that can only be created once
    and is globally accessible throughout the codebase. 

    Ex: URLSession.shared, UserDefaults.standard, FileManager.default

    Pros
        1. Unique: there can only be one
        2. Convenient: We can access it globally, in any file

    Cons
        1. Globally accessible: Could cause bugs
        2. Difficult to unit test
        3. Seperation of concerns

    We can inject the singleton to other files using Dependency Injection rather than accessing it directly.
    This makes it easily testable.
*/

class APIManager {
    static let shared = APIManager() 
    private init() { } // we cannot create an instance of this class outside of this class if there is a private init

    func doSomething() { }
}

let API = APIManager() // error: we cannot create an instance of this class outside of the class if there is a private init

var arr: [Int] = []
print(arr.popLast())