//: [Previous](@previous)

import Foundation

func makeFirstAPICall(completion: @escaping (Result<Data, Error>) -> Void) {
    let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1")!
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            completion(.failure(error))
        } else if let data = data {
            completion(.success(data))
        }
    }
    
    task.resume()
}

func makeSecondAPICall(completion: @escaping (Result<Data, Error>) -> Void) {
    let url = URL(string: "https://jsonplaceholder.typicode.com/posts/2")!
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            completion(.failure(error))
        } else if let data = data {
            completion(.success(data))
        }
    }
    
    task.resume()
}

func performParallelAPICalls() {
    let group = DispatchGroup()
    
    group.enter()
    makeFirstAPICall { result in
        switch result {
        case .success(let data):
            print("First API call success: \(data)")
        case .failure(let error):
            print("First API call failed: \(error)")
        }
        group.leave()
    }
    
    group.enter()
    makeSecondAPICall { result in
        switch result {
        case .success(let data):
            print("Second API call success: \(data)")
        case .failure(let error):
            print("Second API call failed: \(error)")
        }
        group.leave()
    }
    
    group.notify(queue: .main) {
        print("Both API calls completed.")
    }
}

// Call the function
performParallelAPICalls()

//: [Next](@next)
