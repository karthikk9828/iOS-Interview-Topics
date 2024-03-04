
import Foundation

/**
    Swift actors are a new concurrency feature introduced in Swift 5.5 
    that provide a safe and efficient way to manage shared mutable state. 
    Actors are a type of object that can be accessed concurrently from multiple threads, 
    but ensure that access to their mutable state is serialized and thread-safe. 

    Note:
        Actors do not support inheritence.
        Properties and methods of actor can be accessed using `await` keyword.

*/

actor User {
    var score = 10

    func printScore() {
        print("My score is \(score)")
    }

    func copyScore(from other: User) async {
        score = await other.score
    }
}

let actor1 = User()
let actor2 = User()

print(await actor1.score)
// await actor1.copyScore(from: actor2)