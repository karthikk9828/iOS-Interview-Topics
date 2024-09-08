import Foundation
import Combine

var subscriptions: Set<AnyCancellable> = []

enum NetworkError: Error {
    case badServerResponse
}

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

func fetchPosts() -> AnyPublisher<[Post], Error> {
    
    let url = URL(string: "https://jsonplaceholder.typicode.com/postss")!
    
    return URLSession.shared.dataTaskPublisher(for: url)
        .tryMap { data, response in
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                throw NetworkError.badServerResponse
            }
            
            return data
        }
        .decode(type: [Post].self, decoder: JSONDecoder())
        .retry(2)
        .receive(on: DispatchQueue.main) // data will be received on main thread, no need to siwtch to main thread
        .eraseToAnyPublisher()
}

fetchPosts()
    .sink { completion in
        switch completion {
        case .finished:
            print("Finished, update the UI")
            
        case .failure(let error):
            print(error)
        }
    } receiveValue: { posts in
        print(posts[0])
    }
    .store(in: &subscriptions)

