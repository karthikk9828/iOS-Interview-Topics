
import Foundation

let jsonString = """
{
    "name": "John Doe",
    "age": 30,
    "email_address": "john@example.com",
    "dateOfBirth": "20:32 Wed, 28 Aug 2024",
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
    let dateOfBirth: Date
    let address: Address
}

let jsonData = jsonString.data(using: .utf8)!

do {
    let decoder = JSONDecoder() 
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    
    // date formatter for parsing "dateOfBirth" field
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm EEE, dd MMM y"

    decoder.dateDecodingStrategy = .formatted(dateFormatter)
    
    let person = try decoder.decode(Person.self, from: jsonData)
    print(person)
} catch {
    print(error)
}

print("\n\n")

// ------------------------------- if the keys are different for each model, use init(from decoder: Decoder) -------------------------------

let person2Json = """
[
    {
        "firstName": "James",
        "lastName": "Anderson",
        "PhoneNumber": "6274832845",
    },
    {
        "name": "James",
        "lastName": "Anderson",
        "phoneNumber": "6274832845",
    }
]
"""

struct Person2: Decodable {
    var firstName: String?
    var lastName: String
    var phoneNumber: String?
    
    enum CodingKeys: String, CodingKey {
        case firstName = "firstName"
        case name = "name"
        case lastName = "lastName"
        case phoneNumber = "PhoneNumber"
        case phoneNumberLowercase = "phoneNumber"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Try decoding different key variations
        self.firstName = try container.decodeIfPresent(String.self, forKey: .firstName) ??
                         container.decodeIfPresent(String.self, forKey: .name)
        self.lastName = try container.decode(String.self, forKey: .lastName)
        self.phoneNumber = try container.decodeIfPresent(String.self, forKey: .phoneNumber) ??
                           container.decodeIfPresent(String.self, forKey: .phoneNumberLowercase)
    }
}

do {
    let decoder = JSONDecoder() 
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    
    let data = person2Json.data(using: .utf8)!
    let persons = try decoder.decode([Person2].self, from: data)
    print(persons)
} catch {
    print(error)
}