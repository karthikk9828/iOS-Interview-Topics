
class MathOperations {
    func add(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
}

import XCTest
// @testable import YourProject

class YourProjectTests: XCTestCase {
    func testAddition() {
        let mathOperations = MathOperations()
        let result = mathOperations.add(3, 4)
        XCTAssertEqual(result, 7, "Adding 3 and 4 should equal 7")
    }
}

import Foundation

// // Attempting to use sync on the main queue from the main thread can lead to a deadlock
// DispatchQueue.main.sync {
//     print("Attempting to execute a synchronous block on the main thread")
// }

DispatchQueue.main.async {
    // Perform work on the main thread asynchronously
    print("Executing asynchronously on the main thread")
}