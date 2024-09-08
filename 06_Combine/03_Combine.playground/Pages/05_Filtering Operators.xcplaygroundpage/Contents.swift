import Foundation
import Combine

var subscriptions: Set<AnyCancellable> = []

// -------------------- filter -----------------------------------------------------------

let numbersPublisher = (1 ... 10).publisher

let evenNumbersPublisher = numbersPublisher
    .filter { $0 % 2 == 0 }

evenNumbersPublisher
    .sink { value in
        print(value)
    }
    .store(in: &subscriptions)

print("\n-------------------------------------------------------------------------------\n")

// -------------------- compactMap -----------------------------------------------------------
// filters nil results

let stringsPublisher = ["1", "2", "3", "4", "ABCDEF"].publisher

let numbersPublisher2 = stringsPublisher
    .compactMap { Int($0) }

numbersPublisher2
    .sink { value in
        print(value)
    }
    .store(in: &subscriptions)

print("\n-------------------------------------------------------------------------------\n")

// -------------------- debounce -----------------------------------------------------------

let textPublisher = PassthroughSubject<String, Never>()

let debouncedPublisher = textPublisher
    .debounce(
        for: .seconds(0.5),
        scheduler: DispatchQueue.main
    )

debouncedPublisher
    .sink { value in
        print(value)
    }
    .store(in: &subscriptions)

textPublisher.send("A")
textPublisher.send("B")
textPublisher.send("C")

print("\n-------------------------------------------------------------------------------\n")
