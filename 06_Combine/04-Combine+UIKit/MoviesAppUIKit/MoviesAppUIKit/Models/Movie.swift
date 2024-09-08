
import Foundation

struct MoviesResponse: Codable {
    let movies: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case movies = "Search"
    }
}

struct Movie: Codable {
    let title: String
    let year: String
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
    }
}
