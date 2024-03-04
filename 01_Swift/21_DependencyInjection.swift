
/**

    Dependency Injection is giving a class the objects it needs rather than creating the objects in the class

    S.O.L.I.D principles -
            D - Dependency Inversion Principle
    
*/

/**
    1. Initializer Injection:
            Initializer injection involves passing dependencies to an object through its initializer.
*/

class Dependency {}

class Service1 {
    let dependency: Dependency
    
    init(dependency: Dependency) {
        self.dependency = dependency
    }
}

/**
    2. Property Injection:
        Property injection involves setting dependencies through properties after the object has been created.
*/

class Service2 {
    var dependency: Dependency?
}

let service2 = Service2()
service2.dependency = Dependency()

/**
    3. Method Injection:
        Method injection involves passing dependencies as parameters to methods when they are called.        
*/

class Service3 {
    func performTask(dependency: Dependency) {
        // Use the dependency to perform a task
    }
}

/**
    4. Constructor Injection:
        Constructor injection is same as initializer injection but is more commonly associated with dependency injection frameworks. 
        It involves passing dependencies to the constructor of a factory or container that constructs objects.
*/

class UserService {
    let userRepository: UserRepository
    
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    func fetchUser(id: Int) -> User? {
        return userRepository.getUserByID(id)
    }
}

class UserServiceFactory {
    let userRepository: UserRepository
    
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    func createUserService() -> UserService {
        return UserService(userRepository: userRepository)
    }
}

let userRepository = UserRepository()
let userServiceFactory = UserServiceFactory(userRepository: userRepository)
let userService = userServiceFactory.createUserService()