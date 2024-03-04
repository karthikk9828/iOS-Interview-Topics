
import Foundation

// Generic function to add two numbers

// T should conform to Numeric protocol

func add<T: Numeric>(_ a: T, _ b: T) -> T {
    return a + b
}
print(add(1, 2))
print(add(5.78, 12.89))
// print(add("hello", "world")) // error

// we can also conform to Numeric protocol as below

func sum<T>(a: T, b: T) -> T where T : Numeric {
    return a + b
}

print(sum(a: 1, b: 2))
print(sum(a: 5.78, b: 12.89))

// -------------------------------------------------

protocol Drivable {
    var motor: Any { get }
    var wheels: Int { get }
}

struct MT15: Drivable {
    var motor: Any
    var wheels: Int
}

struct Mercedes: Drivable {
    var motor: Any
    var wheels: Int
}

func driveHome<T: Drivable>(vehicle: T) {
    print("Driving \(String(describing: vehicle))")
}

var mt15 = MT15(motor: 1, wheels: 2)
var mercedes = Mercedes(motor: 2, wheels: 4)

driveHome(vehicle: mt15)
driveHome(vehicle: mercedes)

// ------------------Generic function for network calls-------------------------------

func fetchData<T: Decodable>(from url: URL) async throws -> T {
    let (data, _) = try await URLSession.shared.data(from: url)

    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        throw error
    }
} 

struct User: Decodable { }
struct Post: Decodable { }
