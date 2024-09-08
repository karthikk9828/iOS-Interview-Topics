import Foundation

/**
    Liskov Substitution Principle
        - Subtypes must be substitutable for their base types without altering the correctness of the program.
*/

//MARK: - ----------------------------- Non-SOLID Code ------------------------------

class Bird {
    func fly() {
        print("Flying")
    }
}

class Penguin: Bird {
    override func fly() {
        // Penguins can't fly, so we throw an error
        fatalError("Penguins can't fly!")
    }
}

func makeBirdFly(bird: Bird) {
    bird.fly()
}

let someBird = Bird()
makeBirdFly(bird: someBird) // Works fine

let penguin = Penguin()
makeBirdFly(bird: penguin) // Crashes because Penguins can't fly


//MARK: - ----------------------------- SOLID Code ------------------------------

protocol Bird {
    func move()
}

class FlyingBird: Bird {
    func move() {
        fly()
    }
    
    func fly() {
        print("Flying")
    }
}

class Penguin: Bird {
    func move() {
        swim()
    }
    
    func swim() {
        print("Swimming")
    }
}

func makeBirdMove(bird: Bird) {
    bird.move()
}

let someFlyingBird = FlyingBird()
makeBirdMove(bird: someFlyingBird) // Prints "Flying"

let penguin = Penguin()
makeBirdMove(bird: penguin) // Prints "Swimming"
