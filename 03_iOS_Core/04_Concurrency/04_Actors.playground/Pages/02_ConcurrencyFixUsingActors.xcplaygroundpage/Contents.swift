import Foundation

/*
    Actors and Async/Await are available only on iOS 15 (Swift 5.5) and later
 
    Actors are similar to classes, they are reference types, supports properties and methods
    but the difference is actors do not support inheritence
    and actors handle the concurrency related issues like race conditions
 
    actors keep track of mutable and immutable properties
    
    immutable properties - treat them normally like other variables since they will not concurrency issues
    mutable properties - take care of concurrency issues
*/
actor FlightActor {
    
    // we can access this normally since it is immutable
    let company = "Vistara"
    
    // this will also give error without the keyword "nonisolated"
    // "nonisolated" can be used with only computed properties, it cannot be used with stored properties
    nonisolated var companyNameDesc: String {
        "Company is Vistara"
    }
    
    var availableSeats: [String] = ["1A", "1B", "1C"]
   
    func getAvailableSeats() -> [String] {
        return availableSeats
    }
    
    func bookSeat() -> String {
        let bookedSeat = availableSeats.first ?? ""
        availableSeats.removeFirst()
        return bookedSeat
    }
}
    
let flight = FlightActor()

let queue1 = DispatchQueue(label: "queue1")
let queue2 = DispatchQueue(label: "queue2")

// two threads are accessing an object "availableSeats" at the same time and one of them is performing write operation
// the other thread might get incorrect data, this is known as "Race Condition"
queue1.async {
    
    // to use the "await" keyword, wrap the code in a Task {} block
    Task {
        print("Company name: \(flight.company)") // no error since company is let (immutable)
        
        print(flight.companyNameDesc)
        
        let bookedSeat = await flight.bookSeat()
        print("Booked seat is: \(bookedSeat)")
    }
}

queue2.async {
    
    // to use the "await" keyword, wrap the code in a Task {} block
    Task {
        let availableSeats = await flight.getAvailableSeats()
        print("Available Seats are: \(availableSeats)")
    }
}

