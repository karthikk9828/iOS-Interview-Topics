import Foundation
import Combine

var subscriptions: Set<AnyCancellable> = []

enum NumberError: Error {
    case failed
}

// -------------------- tryMap and catch -----------------------------------------------------------

let numbersPublisher = [1, 2, 3, 4, 5].publisher

let transformedPublisher = numbersPublisher
    .tryMap { value in
        if value == 4 {
            throw NumberError.failed
        }
        
        return value
    }
    .catch { error in
        print(error)
        
        return Just(0)
    }

transformedPublisher
    .sink { value in
        print(value)
    }
    .store(in: &subscriptions)
    

print("\n-------------------------------------------------------------------------------\n")

// -------------------- replaceError -----------------------------------------------------------

let numbersPublisher2 = [1, 2, 3, 4, 5].publisher

let transformedPublisher2 = numbersPublisher
    .tryMap { value in
        if value == 4 {
            throw NumberError.failed
        }
        
        return value * 2
    }
    .replaceError(with: -1)

transformedPublisher2
    .sink { value in
        print(value)
    }
    .store(in: &subscriptions)
    

print("\n-------------------------------------------------------------------------------\n")

// -------------------- retry -----------------------------------------------------------

let publisher = PassthroughSubject<Int, Error>()

let retriedPublisher = publisher
    .tryMap { value in
        if value == 3 {
            throw NumberError.failed
        }
        
        return value
    }
    .retry(2)

retriedPublisher
    .sink { completion in
        switch completion {
        case .finished:
            print("publisher has completed")
        case .failure(let error):
            print("publisher has failed with error: \(error)")
        }
    } receiveValue: { value in
        print(value)
    }
    .store(in: &subscriptions)

publisher.send(1)
publisher.send(2)
publisher.send(3) // failed and ignored because retry count = 2
publisher.send(4)
publisher.send(5)
publisher.send(3) // failed and ignored because retry count = 2
publisher.send(6)
publisher.send(7)
publisher.send(3) // failed and thrown error, since already retried 2 times
publisher.send(8)

print("\n-------------------------------------------------------------------------------\n")
