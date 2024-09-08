import Foundation

/*
    DispatchSemaphore
        Similar to DispatchBarrier, used for preventing race condition / access to the critical section
 
    Ex:
        A joint bank account has multiple account holder and multiple debit cards.
        If two people try to withdraw money from two different ATMs at the same time,
        both of them will get the cash they entered, even if their balance is less than their sum
        Balance = 10000, withdraw1 = 10000, withdraw2 = 10000
        Both of them will get 10000 each, but the account balance was 10000 only
 
        the same problem can be solved using DispatchBarrier or DispatchSemaphore
 
    Critical Section
        * Is a part of a program which tries to access shared resources.
        * When critical section is accessed by multiple threads at the same time, there are strong chances of data inconsistency.
        * Solution is to give exclusive access to the critical section
 
    How Semaphores work?
        If multiple threads are trying to access the critical section
            * All the threads will be added to a queue
            * We can set the no. of concurrent accessed / threads allowed at a time using a counter
            * wait() will be called when the thread execution starts, count will be incremented by 1
            * signal() method will called once the thread execution completes and increment the count by 1
            * If the count is non-negative integer, the thread will be allowed to access the resource
            * Repeat for all the threads in the queue created in step 1
 
    Priority Inversion
        High priority tasks should not wait for the access to the critical section because
        the low priority tasks access them first, now high priority tasks are waiting for the access
*/

// Create a semaphore with an initial value of 1
let semaphore = DispatchSemaphore(value: 1)

// Define a shared resource
var sharedResource = 0

// Create a DispatchGroup
let group = DispatchGroup()

// Function to access and modify the shared resource
func modifySharedResource(with value: Int) {
    // Wait until semaphore is available
    semaphore.wait()

    // Modify the shared resource
    sharedResource += value
    print("Shared resource modified. New value: \(sharedResource)")

    // Signal that semaphore is available again
    semaphore.signal()
}

// Perform concurrent tasks that access the shared resource
for i in 1...5 {
    group.enter()
    DispatchQueue.global().async {
        modifySharedResource(with: i)
        group.leave()
    }
}

// Notify when all tasks are completed
group.notify(queue: .main) {
    // Print the final value of the shared resource
    print("Final value of shared resource: \(sharedResource)")
}

