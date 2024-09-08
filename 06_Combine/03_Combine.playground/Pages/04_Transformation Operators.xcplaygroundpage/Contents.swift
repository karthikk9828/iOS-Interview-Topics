
import Foundation
import Combine

var subscriptions: Set<AnyCancellable> = []

// -------------------- map -----------------------------------------------------------

let numbersPublisher = [1, 2, 3, 4, 5].publisher

let squaredNumbersPublisher = numbersPublisher
    .map { "Item: \($0)" }

squaredNumbersPublisher
    .sink { value in
        print(value)
    }
    .store(in: &subscriptions)

print("\n-------------------------------------------------------------------------------\n")

// -------------------- flatMap -----------------------------------------------------------

let namesPublisher = ["ab", "cd", "ef"].publisher

let flattenedNamesPublisher = namesPublisher.flatMap { name in
    name.publisher
}

flattenedNamesPublisher
    .sink {char in
        print(char)
    }
    .store(in: &subscriptions)


print("\n-------------------------------------------------------------------------------\n")

// -------------------- merge -----------------------------------------------------------
// combines multiple publishers into a single one by merging their emissions into a single stream

let publisher1 = [1, 2, 3].publisher
let publisher2 = [4, 5, 6].publisher

let mergedPublisher = Publishers.Merge(publisher1, publisher2)

mergedPublisher
    .sink { value in
        print(value)
    }
    .store(in: &subscriptions)

