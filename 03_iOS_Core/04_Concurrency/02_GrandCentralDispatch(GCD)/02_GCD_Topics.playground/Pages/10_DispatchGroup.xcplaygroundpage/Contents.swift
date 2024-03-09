import UIKit

/*
    Dispatch Group
        A group of tasks that you monitor as a single unit.
        Multiple tasks can be grouped together.
        We can wait for the tasks to be finished, or can continue with some other task and can get notified when tasks in the group completes
        Can be used for grouping multiple API calls together.
        Ex: Download multiple images all at once, move forward when all the images are downloaded.
 
        To achieve this, DispatchGroup provides us with four methods
 
        1. enter() - call this function when a block has been added to the group
        2. leave() - call this function when a block in thr group has finished execution
        3. wait() - call this function when we want to wait for the tasks to be finished before proceeding
                    wait() should not be called on the main thread because it blocks the execution on the current thread
        4. notify() - will be called when all the blocks are finished (enterCount - leaveCount == 0)
 
        DispatchGroup keeps track of the number of tasks,
        * Increments the count when a task enters in enter()
        * Decrements the count when a task completes in leave()
        * When the count is 0, notify() will be called by the DispatchGroup
          we can pass a closure to notify { } to perform any action we want when notify() is called
 
        Refer: 04_DispatchGroup.xcproj for detailed API call example
*/

// Create a dispatch group
let group = DispatchGroup()

// Create a concurrent queue to demonstrate asynchronous tasks
let queue = DispatchQueue(label: "com.example.queue", attributes: .concurrent)

// Perform multiple asynchronous tasks within the dispatch group
for i in 1...5 {
    group.enter()
    queue.async(group: group) {
        // Simulate some asynchronous task
        Thread.sleep(forTimeInterval: TimeInterval.random(in: 1...3))
        print("Task \(i) completed")
        group.leave()
    }
}

// Notify when all tasks are completed
group.notify(queue: .main) {
    print("All tasks have completed")
}

// Perform additional work while waiting for tasks to complete
print("Additional work while waiting for tasks to complete")

// Wait for all tasks to complete before ending the playground execution
// wait should not used on the main thread, it blocks the calling thread which is main thread in this example
//group.wait()

