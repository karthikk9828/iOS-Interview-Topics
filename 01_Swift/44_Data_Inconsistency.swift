
import Foundation

/**

*/

/*
    Multiple threads can read price and also update price using updatePrice(), this can lead to data inconsistency
*/
class Product1 {
    var name: String
    var price: Double

    init(name: String, price: Double) {
        self.name = name
        self.price = price
    }

    func updatePrice(newPrice: Double) {
        self.price = newPrice
    }
}

// Create a Product instance
// let product = Product1(name: "iPhone", price: 999.99)

// // Simulate concurrent reads and writes
// for _ in 0..<100 {
//     DispatchQueue.global().async {
//         // Read the current price
//         let currentPrice = product.price

//         // Perform some computation or delay to simulate processing time
//         // sleep(UInt32(arc4random_uniform(2)))

//         // Update the price with a new value
//         let newPrice = currentPrice * 1.1
//         product.updatePrice(newPrice: newPrice)

//         // Print the updated price
//         print("Updated price: \(newPrice)")
//     }
// }

// // Wait for all tasks to complete
// sleep(1)

// // After the concurrent operations, print the final price
// print("Final price: \(product.price)")

// ---------------------------------------------------------------------------------------------
// We can fix it using a serial queue

class Product2 {
    var name: String
    private var price: Double
    private let priceAccessQueue = DispatchQueue(label: "com.test.priceAccess")

    init(name: String, price: Double) {
        self.name = name
        self.price = price
    }

    func getPrice() -> Double {
        var price: Double = 0
        priceAccessQueue.sync {
            price = price
        }
        return price
    }

    func updatePrice(newPrice: Double) {
        priceAccessQueue.async {[weak self] in
        guard let self = self else { return }
            self.price = newPrice
        }
    }
}

/**
    What happens in the above code if

    1. Two threads try to update the price at the same time?
        Since the queue is serial, only one thread will update the price at a time
        First thread aquires a lock on the price, updates the price, releases the lock
        Second thread aquires a lock on the price, updates the price, releases the lock

    2. Two threads try to read the price at the same time?
        Since the queue is serial and read operation is inside the sync block, 
        once the first thread reads it, the execution will be blocked and once the read is completed,
        second thread will read it synchronously

    Why are we reading the value in a `sync` block but writing in `async` block?
      Why read in sync?
        * Reading the value within a sync block ensures that the value is read atomically (only one read operation at a time)
        * This way we ensure that the value read is the latest one
    
      Why update in async?
        * Means the write operation is performed in the background, possibly on a different thread
        * This allows the calling thread to continue its execution without waiting for the write to complete
        * Helps improve responsiveness if the write operation invloves network operations / time taking operations
*/

/**
    Other ways to fix data inconsistency

    DispatchSemaphore, Operationqueue
*/

// ---------------------------------------------------------------------------------------------
// Fix data inconsistency using DispatchSemaphore

class Product3 {
    var name: String
    var price: Double
    private let priceSemaphore = DispatchSemaphore(value: 1) // 1 concurrent access at a time

    init(name: String, price: Double) {
        self.name = name
        self.price = price
    }

    func getPrice() -> Double {
        priceSemaphore.wait()
        defer {
            priceSemaphore.signal()
        }
        return price
    }

    func updatePrice(newPrice: Double) {
        priceSemaphore.wait()
        defer {
            priceSemaphore.signal()
        }
        self.price = newPrice
    }
}

let product = Product3(name: "iPhone", price: 999.99)

let dispatchGroup = DispatchGroup()

// Simulate concurrent reads and writes
for _ in 0..<20 {
    dispatchGroup.enter()
    DispatchQueue.global().async {
        // Read the current price
        let currentPrice = product.getPrice()

        // Update the price with a new value
        let newPrice = currentPrice * 1.1
        product.updatePrice(newPrice: newPrice)

        // Print the updated price
        print("Updated price: \(newPrice)")
        
        dispatchGroup.leave()
    }
}

// Wait for all tasks to complete
dispatchGroup.wait()

// After the concurrent operations, print the final price
print("Final price: \(product.price)")