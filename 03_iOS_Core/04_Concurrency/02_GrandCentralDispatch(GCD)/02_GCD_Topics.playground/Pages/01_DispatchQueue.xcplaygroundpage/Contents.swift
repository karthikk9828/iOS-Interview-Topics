import Foundation

// main queue uses main thread

DispatchQueue.main.async {
    if Thread.isMainThread {
        print("DispatchQueue.main.async: Executing on main thread")
    } else {
        print("DispatchQueue.main.async: Executing on some other thread")
    }
}

// this will crash, we cannot run sync code on main thread
//DispatchQueue.main.sync {}

// Global concurrent queues async block do not use main thread

DispatchQueue.global().async {
    if Thread.isMainThread {
        print("DispatchQueue.global.async: Executing on main thread")
    } else {
        print("DispatchQueue.global.async: Executing on global concurrent queue thread")
    }
}

// Global concurrent queues sync block uses main thread sometimes when the sync block blocks the main thread, at this point main thread is idle
// so the system will use the main thread since it is idle anyway

DispatchQueue.global().sync {
    if Thread.isMainThread {
        print("DispatchQueue.global.sync: Executing on main thread")
    } else {
        print("DispatchQueue.global.sync: Executing on global concurrent queue thread")
    }
}
