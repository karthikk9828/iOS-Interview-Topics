import Foundation

/*
    MainActor is used for taking care of the things that should be done on Main thread (updating UI)
    instead of using DispatchQueue.main.async we can use MainActor
 
    following can be marked with @MainActor
        
        1. Class
        2. Function
        3. Closure

    Note: 
        * works only for asyncronous code / await
        * if the code uses completion handler, it will not work
*/

// ------------------- 1. Class ------------------------

@MainActor
class ViewModel {

}

// ------------------- 2. Function ------------------------

var textLabel: String = ""

// this will run on main thread
@MainActor
func updateUI() {
    textLabel = "Updated text"
}

print(textLabel)

// ------------------- 3. Closure ------------------------

Task { @MainActor in

}