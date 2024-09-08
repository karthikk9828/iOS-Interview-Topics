import Foundation
import Combine

/*
    There are many different types of publishers
 
    1. Just - emits an output to each subscriber just once, and then finishes
*/

let publisher1 = Just("hello world")

let cancellable = publisher1.sink { value in
    print(value)
}

// cancel will be called automatically once the execution is out of scope even if we don't call it
cancellable.cancel()

/*
    Never
        - a value that is never produced or an event that is never emitted
        - used in the context of errors to indicate that the publisher will never fail with an error
 */

let numbersPublisher = [1, 2, 3, 4].publisher
let doublePublisher = numbersPublisher.map { $0 * 2 }

let cancellable2 = doublePublisher.sink { value in
    print(value)
}
