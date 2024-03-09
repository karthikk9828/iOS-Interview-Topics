//: [Previous](@previous)

import Foundation

/*
    It is a parameter for creating custom queues. Takes three values
 
     let customQueue = DispatchQueue(
         label: ,
         qos: ,
         attributes: ,
         autoreleaseFrequency: ,
         target:
     )
 
    concurrent
        used for creating concurrent queues, by default queues are serial in nature
        by default custom queues are serial, if we set attributes: concurrent, it becomes a concurrent queue
 
    initiallyInactive
        used when we want the execution of the task should start at later point in time, not immediately
 
    concurrent & initiallyInactive
*/

let queue1 = DispatchQueue(label: "B", attributes: .concurrent)
let queue2 = DispatchQueue(label: "B", attributes: .initiallyInactive)
let queue3 = DispatchQueue(label: "B", attributes: [.concurrent, .initiallyInactive])

// if the attribute is .initiallyInactive, we can activate the queue later
queue2.activate()

//: [Next](@next)
