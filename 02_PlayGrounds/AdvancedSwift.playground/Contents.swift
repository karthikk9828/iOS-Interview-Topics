import Foundation

// Observed properties

var pizzaInInches: Int = 10 {
    willSet {
//        print("New pizzaInInches \(newValue)")
    }
    didSet {
        if pizzaInInches >= 18 {
            print("Invalid size given, pizzaInInches set to 18")
            pizzaInInches = 18
        }
    }
}

pizzaInInches = 17
pizzaInInches = 20

// Stored properties

var numberOfPeople: Int = 6
let slicesPerPerson: Int = 5

// Computed properties

var numberOfSlices: Int {
    return pizzaInInches - 4
}

var numberOfPizzas: Int {
    get {
        let numberOfPeopleFedPerPizza = numberOfSlices / slicesPerPerson
        return numberOfPeople / numberOfPeopleFedPerPizza
    }

    set {
        let totalSlices = numberOfSlices * newValue
        numberOfPeople = totalSlices / slicesPerPerson
    }
}

numberOfPizzas = 4

print(numberOfPeople)
