import Foundation

/*
    BlockOperation
         - executes a single block synchronously
         - it executes multiple blocks concurrently on a global queue
*/

func testOperations() {
    let operation: BlockOperation = BlockOperation()
    
    // callback when the execution of the blocks are completed
    operation.completionBlock = {
        print("all blocks completed execution")
    }
    
    // once the execution of all the blocks are completed, the execution of the blockoperation is considered completed
    // the order maybe different because they are executed concurrently
    operation.addExecutionBlock {
        print("first block executed")
    }
    
    operation.addExecutionBlock {
        print("second block executed")
    }
    
    operation.addExecutionBlock {
        print("third block executed")
    }
    
    DispatchQueue.global().async {
        operation.start()
        print("Executed on main thread: \(Thread.isMainThread)")
    }
}

print("about to begin operation")
testOperations()
print("executed operation")
