
import Foundation
import Combine

enum NumberError: Error {
    case operationFailed
}

let numbersPublisher = [1, 2, 3, 4, 5].publisher

let doublednumbersPublisher = numbersPublisher
    // .map does not allow to throw exception, tryMap will allow
    .tryMap { number in
        if number == 4 {
            throw NumberError.operationFailed
        }
        
        return number * 2
    }
    .catch { error in
        if let numberError = error as? NumberError {
            print("NumberError: \(error)")
        }
        
        return Just(0) // catch must return a publisher
    }

let cancellable = doublednumbersPublisher
    .sink { completion in
        switch completion {
        case .finished:
            print("finished")
        case .failure(let error):
            print("Completed with error: \(error)")
        }
    } receiveValue: { value in
        print(value)
    }

print("\n-------------------------------------------------------------------------------\n")

// -----------------Using mapError---------------------------------------------------------------------------------

let doublednumbersPublisher2 = numbersPublisher
    // .map does not allow to throw exception, tryMap will allow
    .tryMap { number in
        if number == 4 {
            throw NumberError.operationFailed
        }
        
        return number * 2
    }
    .mapError { error in
        if let numberError = error as? NumberError {
            return NumberError.operationFailed
        }
        
        return NumberError.operationFailed
    }

let cancellable2 = doublednumbersPublisher2
    .sink { completion in
        switch completion {
        case .finished:
            print("finished")
        case .failure(let error):
            print("Completed with error: \(error)")
        }
    } receiveValue: { value in
        print(value)
    }

print("\n-------------------------------------------------------------------------------\n")
