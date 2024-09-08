import Foundation

/**
    Interface Segregation Principle
        - Clients should not be forced to depend on interfaces they do not use.
*/

//MARK: - ----------------------------- Non-SOLID Code ------------------------------

protocol Worker {
    func work()
    func eat()
}

class HumanWorker: Worker {
    func work() {
        // Human working
    }

    func eat() {
        // Human eating
    }
}

class RobotWorker: Worker {
    func work() {
        // Robot working
    }

    func eat() {
        // Robot doesn't need to eat, but forced to implement
    }
}

//MARK: - ----------------------------- SOLID Code ------------------------------

protocol Workable {
    func work()
}

protocol Eatable {
    func eat()
}

class HumanWorker: Workable, Eatable {
    func work() {
        // Human working
    }

    func eat() {
        // Human eating
    }
}

class RobotWorker: Workable {
    func work() {
        // Robot working
    }
}
