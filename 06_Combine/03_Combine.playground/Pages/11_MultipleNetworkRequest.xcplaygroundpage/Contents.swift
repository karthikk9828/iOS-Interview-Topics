import Foundation
import Combine

var subscriptions: Set<AnyCancellable> = []

struct MoviesResponse: Codable {
    let Search: [Movie]
}

struct Movie : Codable {
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
    }
}

func fetchMovies(_ searchTerm: String) -> AnyPublisher<MoviesResponse, Error> {
    
    let url = URL(string: "https://www.omdbapi.com/?apikey=2cf7f5f6&s=\(searchTerm)")!
    
    return URLSession.shared.dataTaskPublisher(for: url)
        .map(\.data)
        .decode(type: MoviesResponse.self, decoder: JSONDecoder())
        .receive(on: DispatchQueue.main) // data will be received on main thread, no need to siwtch to main thread
        .eraseToAnyPublisher()
}

Publishers.CombineLatest(fetchMovies("spiderman"), fetchMovies("batman"))
    .sink { _ in
    } receiveValue: { movieResponse1, movieResponse2 in
        print(movieResponse1.Search)
        print(movieResponse2.Search)
    }
    .store(in: &subscriptions)

