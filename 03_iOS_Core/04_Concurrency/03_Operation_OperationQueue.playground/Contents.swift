import UIKit

/*
    Operations
        * An abstract class that represents the code and data associated with a single task.
 
        we don't use Operations directly since it is an abstract class, we use two of its subclasses
     
            1. BlockOperation
                    - executes a single block synchronously
                    - it executes multiple blocks concurrently on a global queue
            2. NSInvocationOperation
                    - executes an invocation (a method defined by a target or a selector)
                    - It is only available in Objective-C
            3. we can create our own custom sublasses
 
    States of an Operation
        isReady
            A Boolean value indicating whether the operation can be performed now.
            will happen when we the object is instantiated
 
        isExecuting
            A Boolean value indicating whether the operation is currently executing.
            will happen when we call start()
 
        isCancelled
            A Boolean value indicating whether the operation has been cancelled.
            will happen when we call cancel()
 
        isFinished
            A Boolean value indicating whether the operation has finished executing its task.
 
        isConcurrent
            A Boolean value indicating whether the operation executes its task asynchronously.
 
        isAsynchronous
            A Boolean value indicating whether the operation executes its task asynchronously.
 
    Use GCD when
        * we are not interested in the state of execution, we start the execution and forget about it
 
    Use Operations when
        * we are interested in the state of execution, more functionalities for contolling the task
 
    Apple recommends to use Operations over GCD
*/

// -------------------------------BlockOperation-------------------------------

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
