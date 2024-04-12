
import Foundation

enum Gender {
    case male, female, unspecified
}

struct Person {
    let name: String
    let middleName: String?
    let userName: String?
    let birthdate: Date?
    let address: String?
    let gender: Gender
    
    init(
        name: String,
        middleName: String? = nil,
        userName: String? = nil,
        birthdate: Date? = nil,
        address: String? = nil,
        gender: Gender = .unspecified
    ) {
        self.name = name
        self.middleName = middleName
        self.userName = userName
        self.birthdate = birthdate
        self.address = address
        self.gender = gender
    }
}
