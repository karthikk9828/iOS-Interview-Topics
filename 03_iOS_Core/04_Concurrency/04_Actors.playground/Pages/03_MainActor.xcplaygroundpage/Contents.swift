import Foundation

/*
    MainActor is used for taking care of the things that should be done on Main thread (updating UI)
    instead of using DispatchQueue.main.async we can use MainActor
 
    we can mark our struct / class / method as @MainActor, then it will run on the main thread
*/

var textLabel: String = ""

// this will run on main thread
@MainActor
func updateUI() {
    textLabel = "Updated text"
}

print(textLabel)
