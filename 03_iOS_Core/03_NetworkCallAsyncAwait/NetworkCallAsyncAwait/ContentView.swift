
import SwiftUI

struct ContentView: View {
    
    @State private var user: GitHubUser?
    
    var body: some View {
        VStack(spacing: 20) {
            
            AsyncImage(url: URL(string: user?.avatarUrl ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
            } placeholder: {
                Circle()
                    .foregroundColor(.secondary)
            }
            .frame(width: 120, height: 120)

            Text(user?.userName ?? "username")
                .bold()
                .font(.title3)
            
            Text(user?.bio ?? "This is where the Github bio will be, make it more than two lines.")
                .padding()
            
            Spacer()
        }
        .padding()
        .task {
            do {
                user = try await getUser()
            } catch GitHubError.invalidURL {
                print("Invalid URL")
            } catch GitHubError.invalidResponse {
                print("Invalid Response")
            } catch GitHubError.invalidData {
                print("Invalid Data")
            } catch {
                print(error)
            }
        }
    }
    
    func getUser() async throws -> GitHubUser {
        let baseUrl = "https://api.github.com/users/karthikk9828"
        
        guard let url = URL(string: baseUrl) else {
            throw GitHubError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw GitHubError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(GitHubUser.self, from: data)
        } catch {
            throw GitHubError.invalidData
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct GitHubUser: Codable {
    let userName: String
    let avatarUrl: String
    let bio: String
    
    // Give custom name to JSON field ("login" -> "userName")
    enum CodingKeys: String, CodingKey {
        case userName = "login"
        case avatarUrl
        case bio
    }
}

enum GitHubError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
