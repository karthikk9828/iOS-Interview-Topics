import Foundation
import Combine

var subscriptions: Set<AnyCancellable> = []

/*
    Subjects : allow us to do two things
        - publish a value
        - subscribe to a publisher
*/

/*
    PassthroughSubject
        - does not need an initial value
*/

let passthroughSubject = PassthroughSubject<Int, Never>()

// subscribing
passthroughSubject.sink { value in
    print(value)
}
.store(in: &subscriptions)

// publishing
passthroughSubject.send(1)
passthroughSubject.send(2)

print("\n-------------------------------------------------------------------------------\n")

// -------------------------------------------------------------------------------------------------------

/*
    CurrentValueSubject
        - needs an initial value
        - also retains the last value in .value property
*/

let currentValueSubject = CurrentValueSubject<Int, Never>(1)

// subscribing
currentValueSubject.sink { value in
    print(value)
}
.store(in: &subscriptions)

// publishing
currentValueSubject.send(2)
currentValueSubject.send(3)

print("Last value: \(currentValueSubject.value)")

print("\n-------------------------------------------------------------------------------\n")

// -------------------------------------------------------------------------------------------------------

/*
    Custom subject
        - emits only even numbers
*/

class EvenSubject<Failure: Error>: Subject {
    
    typealias Output = Int
    
    private let wrapped: PassthroughSubject<Int, Failure>
    
    init(initialValue: Int) {
        self.wrapped = PassthroughSubject()
        let evenInitialValue = initialValue % 2 == 0 ? initialValue : 0
        send(evenInitialValue)
    }
    
    func send(_ value: Int) {
        if value % 2 == 0 {
            wrapped.send(value)
        }
    }

    func send(subscription: Subscription) {
        wrapped.send(subscription: subscription)
    }
    
    func send(completion: Subscribers.Completion<Failure>) {
        wrapped.send(completion: completion)
    }
    
    func receive<S>(subscriber: S) where S : Subscriber, Failure == S.Failure, Int == S.Input {
        wrapped.receive(subscriber: subscriber)
    }
    
}

let evenSubject = EvenSubject<Never>(initialValue: 4)

evenSubject
    .sink { value in
        print(value)
    }
    .store(in: &subscriptions)

evenSubject.send(12)
evenSubject.send(13)
evenSubject.send(20)

print("\n-------------------------------------------------------------------------------\n")

