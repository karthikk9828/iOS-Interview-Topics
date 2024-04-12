
import Foundation

let myQueue = DispatchQueue(label: "myQueue")

myQueue.sync {
    print("hello")

    // this block cannot start until the outer sync block is finished
    // outer block will not finish until this inner block is finished
    // the entire thread is blocked forever causing a deadlock
    myQueue.sync {
        print("world")
    }
}

