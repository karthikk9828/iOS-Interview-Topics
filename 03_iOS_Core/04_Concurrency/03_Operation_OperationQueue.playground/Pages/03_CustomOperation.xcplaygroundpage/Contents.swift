import Foundation

// this will run on main thread
class CustomOperation: Operation {
    override func main() {
        for i in 0 ..< 10 {
            print(i)
        }
    }
}

let customOperation = CustomOperation()
print("Custom operation started execution")
customOperation.start()
print("Custom operation finished execution")

print("-------------------------------")

// this will run on different thread
class CustomOperation2: Operation {
    
    override func start() {
        // created a thread and passed main function to it
        // it is not recommended to create our own thread, instead we can use OperationQueue
        Thread.init(block: main).start()
    }
    
    override func main() {
        for i in 0 ..< 10 {
            print(i)
        }
    }
}

let customOperation2 = CustomOperation2()
print("Custom operation2 started execution")
customOperation2.start()
print("Custom operation2 finished execution")
