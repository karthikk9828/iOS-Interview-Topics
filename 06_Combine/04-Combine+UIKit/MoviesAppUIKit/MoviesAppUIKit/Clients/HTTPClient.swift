
import Foundation
import Combine

enum NetworkError: Error {
    case badURL
}

class HTTPClient {
    
    func fetchMovies(_ query: String) -> AnyPublisher<[Movie], Error> {
        
        guard let searchQuery = query.urlEncoded,
              let url = URL(string: "https://www.omdbapi.com/?apikey=2cf7f5f6&s=\(searchQuery)") else {
            return Fail(error: NetworkError.badURL).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: MoviesResponse.self, decoder: JSONDecoder())
            .map(\.movies)
            .receive(on: DispatchQueue.main)
            .catch { error -> AnyPublisher<[Movie], Error> in
                return Just([]).setFailureType(to: Error.self).eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
    
}
