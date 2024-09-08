import Foundation
import Combine

var subscriptions: Set<AnyCancellable> = []

// -------------------- combineLatest -----------------------------------------------------------
// combines the latest values from multiple pulbishers into a single publisher whenever a value is published

let publisher1 = CurrentValueSubject<Int, Never>(1)
let publisher2 = CurrentValueSubject<Int, Never>(2)

let combinedPublisher = publisher1.combineLatest(publisher2)

combinedPublisher
    .sink { value1, value2 in
        print("value1: \(value1)   value2: \(value2)")
    }
    .store(in: &subscriptions)

publisher1.send(3)
publisher2.send(4)

print("\n-------------------------------------------------------------------------------\n")

// -------------------- zip -----------------------------------------------------------

let pub1 = [1, 2, 3, 4].publisher
let pub2 = ["a", "b", "c"].publisher

let zippedPublisher = pub1.zip(pub2)

zippedPublisher
    .sink { value1, value2 in
        print("\(value1) \(value2)")
    }
    .store(in: &subscriptions)

print("\n-------------------------------------------------------------------------------\n")

// zip more than two publishers

let pub3 = [1, 2, 3, 4].publisher
let pub4 = ["a", "b", "c"].publisher
let pub5 = [true, false, true].publisher

let zipped3Publisher = Publishers.Zip3(pub3, pub4, pub5)

zipped3Publisher
    .sink { value in
        print(value.0, value.1, value.2)
//        print("\(value1) \(value2) \(value3)")
    }
    .store(in: &subscriptions)

print("\n-------------------------------------------------------------------------------\n")

// -------------------- switchToLatest -----------------------------------------------------------
// used to switch to the inner publisher whenever the outer publisher emits a value

let outerPublisher = PassthroughSubject<AnyPublisher<Int, Never>, Never>()
let innerPublisher1 = CurrentValueSubject<Int, Never>(1)
let innerPublisher2 = CurrentValueSubject<Int, Never>(2)

outerPublisher
    .switchToLatest()
    .sink { value in
        print(value)
    }
    .store(in: &subscriptions)

outerPublisher.send(AnyPublisher(innerPublisher1))
innerPublisher1.send(10)

outerPublisher.send(AnyPublisher(innerPublisher2))
innerPublisher2.send(20)

print("\n-------------------------------------------------------------------------------\n")
