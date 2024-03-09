import UIKit

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

