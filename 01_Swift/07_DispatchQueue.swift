import Foundation

/**
    DispatchQueue.main is a serial queue, it cannot handle more than one task at a time

*/

func testDispatch() {
    // print("1")
    // DispatchQueue.background.async {
    //     print("2")
    //     DispatchQueue.main.async {
    //         print("3")
    //     }
    //     print("4")
    //     DispatchQueue.main.sync {
    //         print("5")
    //     }
    //     DispatchQueue.main.async {
    //         print("6")
    //         // deadlock, executing sync block in main queue inside a block that is already in main queue, it will never execute
    //         DispatchQueue.main.sync {
    //             print("7")
    //         }
    //     }
    //     print("8")
    // }
    // print("9")

    DispatchQueue.main.async {
        print("6")
        // deadlock, executing sync block in main queue inside a block that is already in main queue, it will never execute
        DispatchQueue.main.sync {
            print("7")
        }
    }
}

testDispatch()

let a = (2, 4, 9, 0, 8)
print(a)
print(a)

// // Attempting to use sync on the main queue from the main thread can lead to a deadlock
// DispatchQueue.main.sync {
//     print("Attempting to execute a synchronous block on the main thread")
// }

DispatchQueue.main.async {
    // Perform work on the main thread asynchronously
    print("Executing asynchronously on the main thread")
}