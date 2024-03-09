import UIKit

/*
    DispatchWorkItem
        * Encapsulates a block of code
        * Can be dispatched on both DispatchQueue and DispatchGroup
        * Provides the flexibility to cancel the task (if execution has started)
 
        How `cancel()` works?
            * If it is set "true" before execution, task won't execute
            * If work item is cancelled during execution "cancel" will return true but the execution won't abort
            * wait() and notify() works the same way
 
        Ex: when to use DispatchWorkItem
            We are searching for the text entered by the user,
            search if it exists in the server only after the user has stopped typing
            if there is already a task running, cancel it
            then call the task / api with some delay (the user has stopped typing)
*/

class Controller {
    var workItem: DispatchWorkItem?
    
    func getSearchResults(_ query: String) {
        workItem?.cancel()
        
        let newWorkItem = DispatchWorkItem {
            print("Made API call for \(query)")
        }
        
        workItem = newWorkItem
        DispatchQueue.global().asyncAfter(deadline: .now() + .milliseconds(30), execute: newWorkItem)
    }
}

let controller = Controller()

controller.getSearchResults("h")
controller.getSearchResults("he")
Thread.sleep(forTimeInterval: TimeInterval.random(in: 1...3))
controller.getSearchResults("hel")
controller.getSearchResults("hell")

// -------------------------DispatchWorkItemFlags-------------------------------------

/*
    DispatchWorkItemFlags
        * A set of behaviours for a work item
        * Its quality-of-service class, whether to create a barrier or spawn a new detached thread
 
        assignCurrentContext
            Set the attributes of the work item to match the attributes of the current execution context.
 
        detached
            Disassociate the work item's attributes from the current execution context.
 
        enforceQoS
            Prefer the quality-of-service class associated with the block.
 
        inheritQoS
            Prefer the quality-of-service class associated with the current execution context.
 
        noQoS
            Execute the work item without assigning a quality-of-service class.
 
        barrier
         Cause the work item to act as a barrier block when submitted to a concurrent queue.
 
    Most used flags are barrier and assignCurrentContext
 
    DispatchBarrier (.barrier) is used when we want to control the access or prevent race condition
*/

