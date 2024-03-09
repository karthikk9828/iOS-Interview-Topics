import Foundation

var value: Int = 20
let serialQueue = DispatchQueue(label: "com.queue.serialAsync")

func doAsyncTaskInSerialQueue() {
    for i in 1 ... 3 {
        serialQueue.async {
            if Thread.isMainThread {
                print("serialAsync: task running on main thread")
            } else {
                print("serialAsync: task running on some other thread") // this will be printed
            }
            let imageUrl = URL(string: "https://unsplash.com/photos/a-person-wearing-a-white-mask-standing-in-front-of-neon-signs-xZDk453dHbg")!
            let _ = try! Data(contentsOf: imageUrl)
            print("serialAsync: \(i) finished downloading.")
        }
    }
}

doAsyncTaskInSerialQueue()

serialQueue.async {
    for i in 0 ... 3 {
        value = i
        print("serialAsync: \(value) ✴️")
    }
}

print("serialAsync: Last line in playground 🎉")
