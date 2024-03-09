
// GCD - Grand Central Dispatch

/*

GCD key features

Dispatch queues: FIFO (First-In-First-Out) queues where tasks are processed sequentially.
Dispatch blocks: Units of code submitted to queues for asynchronous execution.
Dispatch groups: Used to synchronize the execution of multiple tasks.
Semaphores: Control access to shared resources and prevent race conditions.

What is concurrency?
    Doing multiple tasks at the same time
    Multi-core processor allows us to do this

Two types of Queue
    1. Serial queue
       Tasks are executed in order, if task 2 is added to the queue, task2 is not executed until task1 is 100% completed

       * Predictable execution order
       * Prevents race condition

       By default every app get one serial queue "main"

       * main queue uses main thread
       * main queue is the only queue with the access to the main thread, no other queue can access main thread
       * UIKit is tied to main thread. So any update to the UI elements will be done through the runloop of the main thread (or) main runloop

    2. Global Concurrent queue
       Tasks start in the same order, however task2 does not have to wait for task1 to complete
       This will happen fast but the result is unpredictable

       * does not use main thread
       * Faster
       * Unpredictable order

       By default every app get four concurrent queues with various priorities
       Priorities are decided by Quality of Service (QoS)

       Ex:
       * To save user preferences, we don't really care about the order

*/

import Foundation

func testDispatchQueue() {
    DispatchQueue.main.async {
        print("DispatchQueue.main.async")
    }

    DispatchQueue.global(qos: .background).async {
        // qos: Quality Of Service
        // code to run of background queue
        print("DispatchQueue.main.async")
    }
}


/**
Synchronous block

*/

let queue = DispatchQueue(label: "queue")
queue.sync {
    print("in sync block 1")

    // this will crash because it will cause deadlock
    // Deadlock : is a situation where two processes are waiting for a resource to be free, but is impossible for it to be free

    // inorder for this sync block to execute, the parent block must finish first, but the parent will wait for this block to finish
    // and this sync block will wait for parent to start its execution causing a deadlock
    queue.sync {
        print("in nested sync block 1")
    }
}

// deadlock another example

import Foundation

let bookingCounterQueue = DispatchQueue(label: "bookingCounterQueue")
let carDriverQueue = DispatchQueue(label: "carDriverQueue")

carDriverQueue.sync {
    print("Give me two movie tickets")

    bookingCounterQueue.sync {
        print("which movie?")
    }

    carDriverQueue.sync {
        print("I'll ask my boss once you give me the tickets")
    }
}

/* 

--------- DispatchQueue.main.sync -----------

when we use use DispatchQueue.main.sync -> we are blcoking the only available thread for the execution, since main queue is a serial queue
and it has only one thread, this will also result in a deadlock causing the app to crash.

*/

/**

--------- Why UI should be updated on the Main thread only -----------
    UIKit is tied to main thread. So any update to the UI elements will be done through the runloop of the main thread (or) main runloop

    Whenever we make some update to a UI element, it is re-rendered on the screen. 
    All this re-rendering should happen in one go. If we make it asynchrounous, we might end-up having flickering

    We cannot update the UI on the background thread (DispatchQueue(label: "myqueue").async), we can create UI on the background thread
    We can only update UI on main thread DispatchQueue.main.async

*/