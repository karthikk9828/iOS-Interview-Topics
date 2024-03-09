import Foundation

var value: Int = 20
let concurrentQueue = DispatchQueue(label: "com.queue.concurrentAsync", attributes: .concurrent)

func doAsyncTaskInConcurrentQueue() {
    for i in 1 ... 3 {
        concurrentQueue.async {
            if Thread.isMainThread {
                print("concurrentAsync: task running on main thread")
            } else {
                print("concurrentAsync: task running on some other thread") // this will be printed
            }
            let imageUrl = URL(string: "https://unsplash.com/photos/a-person-wearing-a-white-mask-standing-in-front-of-neon-signs-xZDk453dHbg")!
            let _ = try! Data(contentsOf: imageUrl)
            print("concurrentAsync: \(i) finished downloading.")
        }
    }
}

doAsyncTaskInConcurrentQueue()

concurrentQueue.async {
    for i in 0 ... 3 {
        value = i
        print("concurrentAsync: \(value) ✴️")
    }
}

print("concurrentAsync: Last line in playground 🎉")
