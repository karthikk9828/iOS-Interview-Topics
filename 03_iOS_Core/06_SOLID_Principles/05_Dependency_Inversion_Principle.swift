import Foundation

/**
    Dependency Inversion Principle
        - High-level modules should not depend on low-level modules. Both should depend on abstractions. 
          Abstractions should not depend on details; details should depend on abstractions.
*/

//MARK: - ----------------------------- Non-SOLID Code ------------------------------

class Backend {
    func fetchData() -> String {
        return "Data from backend"
    }
}

class Frontend {
    let backend = Backend()

    func renderData() {
        let data = backend.fetchData()
        print("Rendering \(data)")
    }
}

//MARK: - ----------------------------- SOLID Code ------------------------------

protocol DataService {
    func fetchData() -> String
}

class Backend: DataService {
    func fetchData() -> String {
        return "Data from backend"
    }
}

class Frontend {
    let dataService: DataService

    init(dataService: DataService) {
        self.dataService = dataService
    }

    func renderData() {
        let data = dataService.fetchData()
        print("Rendering \(data)")
    }
}
