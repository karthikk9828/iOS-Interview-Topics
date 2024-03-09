import Foundation

class Flight {
    let company = "Vistara"
    var availableSeats: [String] = ["1A", "1B", "1C"]
    
    // fix race condition using a dispatch barrier
    // instead of manually handling like this, we can use Actors, they will take care of all this
    let barrierQueue = DispatchQueue(label: "barrierQueue", attributes: .concurrent)
    
    func getAvailableSeats() -> [String] {
        barrierQueue.sync(flags: .barrier) {
            return availableSeats
        }
    }
    
    func bookSeat() -> String {
        barrierQueue.sync(flags: .barrier) {
            let bookedSeat = availableSeats.first ?? ""
            availableSeats.removeFirst()
            return bookedSeat
        }
    }
}

func raceConditionFix() {
    
    let flight = Flight()
    
    let queue1 = DispatchQueue(label: "queue1")
    let queue2 = DispatchQueue(label: "queue2")
    
    // two threads are accessing an object "availableSeats" at the same time and one of them is performing write operation
        // the other thread might get incorrect data, this is known as "Race Condition"
    queue1.async {
        let bookedSeat = flight.bookSeat()
        print("Booked seat is: \(bookedSeat)")
    }
    
    queue2.async {
        let availableSeats = flight.getAvailableSeats()
        print("Available Seats are: \(availableSeats)")
    }
}

raceConditionFix()
