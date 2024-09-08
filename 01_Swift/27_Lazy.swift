
import Foundation

// Usecase 1 : When a property needs initialization of other properties before we use it

struct Player {
    var name: String 
    var team: String 
    var role: String 

    lazy var introduction = {
        return "Now entring the game: \(name), \(role) for the \(team)"
    }()
}

var deVilliers = Player(name: "AB deVilliers", team: "RCB", role: "Batsman")
print(deVilliers.introduction)

// Usecase 2 : 

struct Calculator {
    static func calculateGamesPlayed() -> Int {
        print(#function)
        var games: [Int] = []
        for i in 0 ... 4000 {
            games.append(i) 
        }
        return games.last!
    }
}

struct Player2 {
    var name: String 
    var team: String 
    var role: String 

    // this will calculate it everytime, even when we do not need to access it
    // var gamesPlayed = Calculator.calculateGamesPlayed()

    // calculate only when we access it
    lazy var gamesPlayed = {
        return Calculator.calculateGamesPlayed()
    }() 

    lazy var introduction = {
        return "Now entring the game: \(name), \(role) for the \(team)"
    }()
}

var player2 = Player2(name: "Player 2", team: "RCB", role: "Batsman")
print(player2.introduction)

/**
    Difference between `computed property` and `lazy`

    Computed property: 
        Calculate everytime that property is accessed.

    Lazy:
        Stores the result after calculating, next time stored result will be used.

    Lazy properties are not thread safe, if multiple threads access the lazy property at once,
    there is no guarantee that the property will be initialised only once. 
*/

// -------------------------------------------------------------------------------------------------------

// Combining Singleton with Lazy

class APIManager {
    // becomes lazy automatically
    static let shared: APIManager = {
        print("Init shared")
        return APIManager() 
    }()

    func call() {
        print("API called")
    }

    private init() {} // private init makes sure that this class cannot be instatiated from outside of this class
}

print(APIManager.shared.call())

var arr = [1, 2, 3, 4]
print(arr.map { $0 * 2 })

print(arr.flatMap { $0 * 2 })
