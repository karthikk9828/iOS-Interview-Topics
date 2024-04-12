
import Foundation

/**
    Async Await is a new concurrency feature introduced in Swift 5.5 (iOS 15) and later   
*/

struct GitHubUser: Codable {
    let avatar_url: String
    let bio: String
}

func fetchData() async throws -> GitHubUser {
    let url = URL(string: "https://api.github.com/users/karthikk9828")!
    let (data, response) = try await URLSession.shared.data(from: url)
    return try JSONDecoder().decode(GitHubUser.self, from: data)
}

do {
    let data = try await fetchData()
    print(data)
} catch {
    print(error)
}