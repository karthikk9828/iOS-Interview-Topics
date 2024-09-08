
import Foundation 

struct App {
    let name: String
    let monthlyPrice: Double
    let users: Int
}

let apps = [
    App(name: "Instagram", monthlyPrice: 11.99, users: 4356),
    App(name: "WhatsApp", monthlyPrice: 0.00, users: 1756),
    App(name: "Youtube", monthlyPrice: 3.99, users: 7598),
    App(name: "Chrome", monthlyPrice: 1.99, users: 34081),
]

// ----------------- Filter ----------------------

let freeApps = apps.filter { $0.monthlyPrice == 0.00 }
print(freeApps.map { $0.name }.joined(separator: ", "))

let highUsersApps = apps.filter { $0.users > 5000 }
print(highUsersApps.map { $0.name }.joined(separator: ", "))

// ----------------- Map ----------------------

let appNames = apps.map { $0.name }.sorted()
print(appNames)

// ----------------- Reduce ----------------------

let numbers = [1, 2, 3, 4, 5]
let sum = numbers.reduce(0, +)
print(sum)

let totalUsers = apps.reduce(0, { $0 + $1.users })
print(totalUsers)

// ----------------- Chaining ----------------------

let recurringRevenue = apps.map { $0.monthlyPrice * Double($0.users) }.reduce(0, +)
print(recurringRevenue)

// ----------------- Compact Map ----------------------

// compact map returns an array after removing nil values from array

let nilNumers: [Int?] = [1, nil, 7, 5, nil, 88, 67, 32, nil]
let nonNilNumbers = nilNumers.compactMap { $0 }
print(nonNilNumbers)

let numStrings = ["1", "2", "hello", "3", "world"]
let nums = numStrings.compactMap { Int($0) }
print(nums)

// custom compactMap implementation
extension Collection {
    func myCompactMap<T>(_ transform: (Element) -> T?) -> [T] {
        var result = [T]() 

        for value in self {
            if let transformedVal = transform(value) {
                result.append(transformedVal)
            }
        }

        return result
    }
}

print(["1", "2", "hello", "3", "world"].myCompactMap { Int($0) })

// ----------------- Flat Map ----------------------

// If we have an array of arrays, it flattens them into a single array

let arrayOfArrays: [[Int]] = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]

let singleArray = arrayOfArrays.flatMap { $0.map { $0 * 2 } }
print(singleArray)