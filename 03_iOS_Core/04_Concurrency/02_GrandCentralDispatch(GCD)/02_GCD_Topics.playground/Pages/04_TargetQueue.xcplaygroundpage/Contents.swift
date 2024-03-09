//: [Previous](@previous)

import Foundation

/*
    It is a parameter for creating custom queues.

    let customQueue = DispatchQueue(
      label: ,
      qos: ,
      attributes: ,
      autoreleaseFrequency: ,
      target:
    )
 
    Target Queue
        * Is a queue that our custom queue will use behind the scenes.
        * A dispatch queue's priority is inherited from its target queue.
        * If we don't specify a target queue, it's "default priority global queue (Global default QoS)" by default.
 
    All the tasks we dispatch to main queue or global concurrent queues will be executed on a fixed set of system defined queues
    known as Target Queues
 
    We can use target queues to set the priority for the tasks of our custom created queues
*/

// a is serial queue by default
// if we set attribe: .concurrent, it becomes a concurrent queue
let a = DispatchQueue(label: "A")

// b is concurrent queue
// target queue for "b" is set as "a"
// since the queue will inherit the behaviour from its target queue,
// b will act as a serial queue because b's target queue is "a"
let b = DispatchQueue(label: "B", attributes: .concurrent, target: a)

a.async {
    for i in 0 ... 5 {
        print(i)
    }
}

a.async {
    for i in 6 ... 10 {
        print(i)
    }
}

// these two blocks will also be dispatched on a serial queue because b's target queue "a" is serial queue
b.async {
    for i in 11 ... 15 {
        print(i)
    }
}

b.async {
    for i in 16 ... 20 {
        print(i)
    }
}

// ------------------------------- Setting target queue after initialization -------------------------------

let queue1 = DispatchQueue(label: "queue1", attributes: .concurrent)
let queue2 = DispatchQueue(label: "queue2", attributes: [.concurrent, .initiallyInactive])

queue2.setTarget(queue: queue1) // this will crash because the queue2 is already activated

// to fix the crash, we can keep the queue inactivated initially, add the target queue and then activate the queue.

let queue3 = DispatchQueue(label: "queue3", attributes: .concurrent)
let queue4 = DispatchQueue(label: "queue4", attributes: .initiallyInactive)

queue4.setTarget(queue: queue3)

queue4.async {
    print("testing")
}

// if the attribute is .initiallyInactive, we can activate the queue later
queue4.activate()

//: [Next](@next)
