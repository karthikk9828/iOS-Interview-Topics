
enum Weather : CaseIterable {
    case sunny, rainy, windy
}

for weather in Weather.allCases {
    print(weather)
}

// Enums with Associated values

enum Response {
    case succeeded(Int, Bool)
    case failed(String)
}

let response1: Response = .succeeded(100, true)

switch response1 {
case .succeeded(let myValue, let myBoolean):
    print(myValue, myBoolean)
case .failed(let error):
    print(error)
default:
    print("Unknown case")
}

enum Planet: Int {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

print(Planet.earth.rawValue)