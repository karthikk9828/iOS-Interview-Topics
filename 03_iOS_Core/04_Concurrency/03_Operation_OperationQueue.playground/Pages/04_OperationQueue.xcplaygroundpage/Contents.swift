import Foundation

func testOperations() {
    let operationQueue: OperationQueue = OperationQueue()
    operationQueue.maxConcurrentOperationCount = 1 // this makes the queue serial, if we don't set this, queue will execute tasks concurrently
    
    let operation1: BlockOperation = BlockOperation()
    operation1.addExecutionBlock {
        for i in 1 ... 10 {
            print("operation1 print \(i)")
        }
    }
    operation1.completionBlock = {
        print("operation1 finished executed")
    }
    
    let operation2: BlockOperation = BlockOperation()
    operation2.addExecutionBlock {
        for i in 11 ... 20 {
            print("operation2 print \(i)")
        }
    }
    operation2.completionBlock = {
        print("operation2 finished executed")
    }
    
    // operationQueue exectes operations on a different thread, not on main thread
    operationQueue.addOperation(operation1)
    operationQueue.addOperation(operation2)
}

testOperations()
print("executed all operation")
