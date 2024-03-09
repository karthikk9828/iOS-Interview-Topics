import Foundation

/*
    DispatchBarrier (.barrier)
        is used when we want to control the access or prevent race condition
*/

// Create a concurrent queue
let concurrentQueue = DispatchQueue(label: "com.example.concurrentQueue", attributes: .concurrent)

// Task 1
concurrentQueue.async {
    for i in 0 ..< 5 {
        sleep(2)
        print("Task 1 async \(i)")
    }
}

// Task 2
concurrentQueue.sync {
    for i in 0 ..< 5 {
        sleep(1)
        print("Task 2 sync without barrier \(i)")
    }
}

// Task 3
// when a task is added as a barrier and starts executing, it stops the execution of other tasks, once this block completes, other blocks will continue executing
concurrentQueue.sync(flags: .barrier) {
    for i in 0 ..< 5 {
        sleep(1)
        print("Task 3 sync with barrier \(i)")
    }
}

// Task 4
concurrentQueue.sync {
    for i in 5 ..< 10 {
        sleep(1)
        print("Task 4 async \(i)")
    }
}
