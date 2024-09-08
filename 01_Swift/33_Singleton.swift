
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

// let API = APIManager() // error: we cannot create an instance of this class outside of the class if there is a private init

// ----------------- Singletons are not thread-safe ------------------------------

class Logger {
    static let shared = Logger() 
    private init() {}

    private var logs: [String : Any] = [:]

    func writeToLog(key: String, value: Any) {
        logs[key] = value
        print("Logged. key: \(key), value: \(value)")
    }
}

func test() {

    let queue = DispatchQueue(label: "SingletonDemo", attributes: .concurrent)
    for i in 1 ... 200 {
        queue.async {
            Logger.shared.writeToLog(key: "key \(i)", value: "value \(i)")
        }
    }
}

// test()

// ----------------- Make Singletons thread-safe using dispatch barrier ------------------------------

class Logger2 {
    static let shared = Logger2() 
    private init() {}

    private var logs: [String : Any] = [:]

    private let serialQueue = DispatchQueue(label: "LoggerQueue", attributes: .concurrent)

    func writeToLog(key: String, value: Any) {
        serialQueue.async(flags: .barrier) { [weak self] in
            self?.logs[key] = value
            print("Logged. key: \(key), value: \(value)")
        }
    }
}

func test2() {
    let queue = DispatchQueue(label: "SingletonDemo", attributes: .concurrent)
    for i in 1 ... 200 {
        queue.async {
            Logger2.shared.writeToLog(key: "key \(i)", value: "value \(i)")
        }
    }
}

test2()