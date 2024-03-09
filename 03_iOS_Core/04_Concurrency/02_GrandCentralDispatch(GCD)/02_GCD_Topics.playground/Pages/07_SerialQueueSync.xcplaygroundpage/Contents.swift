import Foundation

var value: Int = 20
let serialQueue = DispatchQueue(label: "com.queue.serialSync")

func doSyncTaskInSerialQueue() {
    for i in 1 ... 3 {
        serialQueue.sync {
            if Thread.isMainThread {
                // this will be printed
                // even though it is a custom queue, why is it using main thread?
                // Concurrent or Custom queues sync block uses main thread sometimes when the sync block blocks the main thread, at this point main thread is idle
                // so the system will use the main thread since it is idle anyway
                print("serialSync: task running on main thread")
            } else {
                print("serialSync: task running on some other thread")
            }
            let imageUrl = URL(string: "https://unsplash.com/photos/a-person-wearing-a-white-mask-standing-in-front-of-neon-signs-xZDk453dHbg")!
            let _ = try! Data(contentsOf: imageUrl)
            print("serialSync: \(i) finished downloading.")
        }
    }
}

doSyncTaskInSerialQueue()

serialQueue.async {
    for i in 0 ... 3 {
        value = i
        print("serialSync: \(value) ✴️")
    }
}

print("serialSync: Last line in playground 🎉")
