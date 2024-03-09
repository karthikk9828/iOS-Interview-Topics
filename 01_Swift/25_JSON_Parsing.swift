
import Foundation

let dataString = """
{
    "name": "John Doe",
    "age": 30,
    "email_address": "john@example.com",
    "address": {
        "city": "New York",
        "country": "USA"
    }
}
"""

// TODO: Add CodingKeys for custom field name

struct Address: Codable {
    let city: String
    let country: String
}

struct Person: Codable {
    let name: String
    let age: Int
    let emailAddress: String
    let address: Address
}

let jsonData = Data(dataString.utf8)

do {
    let decoder = JSONDecoder() 
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    
    let person = try decoder.decode(Person.self, from: jsonData)
    print(person)
} catch {
    print(error)
}
