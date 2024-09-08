import Foundation

/**
    Implement a custom DispatchGroup - system design interview question
*/

protocol TaskRegestrationManageable {
    var pendingTasksCount: Int { get }
    func enter() 
    func leave(completion: @escaping () -> Void)
}

protocol CompletionHandleable {
    func notify(queue: DispatchQueue, execute: @escaping () -> Void)
    func handleCompleteion()
}

protocol WaitManageable {
    func wait(for taskRegestration: TaskRegestrationManageable)
    func wait(timeout: DispatchTime, for taskRegestration: TaskRegestrationManageable) -> DispatchTimeoutResult
}

class TaskRegestrationManager: TaskRegestrationManageable {
    var pendingTasksCount: Int = 0

    func enter() {
        pendingTasksCount += 1
    }

    func leave(completion: @escaping () -> Void) {
        pendingTasksCount -= 1
        if pendingTasksCount == 0 {
            completion()
        }
    }
}

class CompletionHandlerManager: CompletionHandleable {
    public init() {}

    private var completion: @escaping () -> Void

    func notify(queue: DispatchQueue, execute: @escaping () -> Void) {
        completion = execute
    }

    func handleCompleteion() {
        completion()
    }
}

class WaitManager: WaitManageable {
    func wait(for taskRegestration: TaskRegestrationManageable) {
        while taskRegestration.pendingTasksCount > 0 {
            Thread.sleep(forTimeInterval: 0.1)
        }
    }

    func wait(timeout: DispatchTime, for taskRegestration: TaskRegestrationManageable) -> DispatchTimeoutResult {
        var result: DispatchTimeoutResult = .success

        let semaphore = DispatchSemaphore(value: 0)

        while taskRegestration.pendingTasksCount > 0 {
            let remainingTime = timeout.uptimeNanoseconds - DispatchTime.now().uptimeNanoseconds

            if remainingTime <= 0 {
                result = .timedOut
                break
            }

            let waitTime = DispatchTime.now() + DispatchTimeInterval.nanoseconds(Int(remainingTime))

            DispatchQueue.global().async {
                if taskRegestration.pendingTasksCount == 0 {
                    semaphore.signal()
                }
            }

            let waitResult = semaphore.wait(timeout: waitTime)
            if waitResult == .timedOut {
                result = .timedOut
                break
            }
        }

        return result
    }
}

class CustomDispatchGroup {
    private let taskRegestrationManager: TaskRegestrationManageable
    private let completionHandlerManager: CompletionHandleable
    private let waitManager: WaitManageable

    init(
        taskRegestrationManager: TaskRegestrationManageable, 
        completionHandlerManager: CompletionHandleable,
        waitManager: WaitManageable
    ) {
        self.taskRegestrationManager = taskRegestrationManager
        self.completionHandlerManager = completionHandlerManager
        self.waitManager = waitManager
    }

    convenience init() {
        self.init(
            taskRegestrationManager: TaskRegestrationManager(), 
            completionHandlerManager: CompletionHandlerManager(), 
            waitManager: WaitManager()
        )
    }

    func enter() {
        taskRegestrationManager.enter()
    }

    func leave() {
        taskRegestrationManager.leave(completion: completionHandlerManager.handleCompleteion)
    }

    func notify(queue: DispatchQueue, execute: @escaping () -> Void) {
        completionHandlerManager.notify(queue: queue, execute: execute)
    }

    func wait() {
        waitManager.wait(for: taskRegestrationManager)
    }

    func wait(timeout: DispatchTime) -> DispatchTimeoutResult {
        return waitManager.wait(timeout: timeout, for: taskRegestrationManager)
    }
}

// test

var group = CustomDispatchGroup()
let queue = DispatchQueue(label: "com.example.queue", attributes: .concurrent)

for i in 1...5 {
    group.enter()
    queue.async(group: group) {
        Thread.sleep(forTimeInterval: TimeInterval.random(in: 1...3))
        print("Task \(i) completed")
        group.leave()
    }
}

// Notify when all tasks are completed
group.notify(queue: .main) {
    print("All tasks have completed")
}