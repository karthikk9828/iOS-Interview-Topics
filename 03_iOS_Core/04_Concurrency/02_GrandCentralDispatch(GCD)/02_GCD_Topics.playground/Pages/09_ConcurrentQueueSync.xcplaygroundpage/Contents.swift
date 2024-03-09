import Foundation

var value: Int = 20
let concurrentQueue = DispatchQueue(label: "com.queue.concurrentSync", attributes: .concurrent)

func doSyncTaskInConcurrentQueue() {
    for i in 1 ... 3 {
        concurrentQueue.sync {
            if Thread.isMainThread {
                // this will be printed
                // even though it is a custom queue, why is it using main thread?
                // Concurrent or Custom queues sync block uses main thread sometimes when the sync block blocks the main thread, at this point main thread is idle
                // so the system will use the main thread since it is idle anyway
                print("concurrentSync: task running on main thread")
            } else {
                print("concurrentSync: task running on some other thread")
            }
            let imageUrl = URL(string: "https://unsplash.com/photos/a-person-wearing-a-white-mask-standing-in-front-of-neon-signs-xZDk453dHbg")!
            let _ = try! Data(contentsOf: imageUrl)
            print("concurrentSync: \(i) finished downloading.")
        }
    }
}

doSyncTaskInConcurrentQueue()

concurrentQueue.async {
    for i in 0 ... 3 {
        value = i
        print("concurrentSync: \(value) ✴️")
    }
}

print("concurrentSync: Last line in playground 🎉")
