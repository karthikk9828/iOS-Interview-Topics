import Foundation

/*
    If there are async operations, we can use the states like isReady, isFinished etc.
    these are KVO (Key-Value-Observers)
*/

func testOperations() {
    let operationQueue: OperationQueue = OperationQueue()
    
    let operation1: BlockOperation = BlockOperation(block: printOneToTen)
    let operation2: BlockOperation = BlockOperation(block: printElevenToTwenty)
    
    // even though it is a dependency, it will consider the execution of operation1 as finished as soon as the dispatch block is executed
    // to fix this, use state properties / observers
    operation2.addDependency(operation1)
    operationQueue.addOperation(operation1)
    operationQueue.addOperation(operation2)
}

func printOneToTen() {
    DispatchQueue.global().async {
        for i in 0 ... 10 {
            print(i)
        }
    }
}

func printElevenToTwenty() {
    DispatchQueue.global().async {
        for i in 11 ... 20 {
            print(i)
        }
    }
}

testOperations()
print("executed all operation")
