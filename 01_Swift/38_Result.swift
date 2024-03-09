import Foundation

/**
    In Swift, a result block typically refers to a closure that encapsulates the result of an asynchronous operation. 
    It's commonly used in scenarios where you need to perform an operation that may succeed or fail, 
    and you want to handle the result (success or failure) in a structured manner.
*/

// Example asynchronous operation that returns a result
func performAsyncOperation(completion: @escaping (Result<String, Error>) -> ()) {
    // Simulate an asynchronous operation
    DispatchQueue.main.async {
        // Assume the operation succeeds
        completion(.success("Operation completed successfully"))
        
        // Or, if the operation fails:
        // let error = NSError(domain: "MyErrorDomain", code: 123, userInfo: nil)
        // completion(.failure(error))
    }
}

performAsyncOperation { result in
    switch result {
    case .success(let value):
        print("Operation succeeded with value: \(value)")
    case .failure(let error):
        print("Operation failed with error: \(error)")
    }
}