import UIKit

class CustomThread {
    func createThread() {
        let thread: Thread = Thread(target: self, selector: #selector(threadSelector), object: nil)
        thread.start()
    }
    
    @objc func threadSelector() {
        print("Custom thread in action")
    }
}

let customThread = CustomThread()
customThread.createThread()
