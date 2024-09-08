import Foundation
import Combine

/*
    1. TimerPublisher
        - publish an event at every interval (ex: every 1 second)
*/
let timerPublisher = Timer.publish(every: 1, on: .main, in: .common)
let cancellable1 = timerPublisher
    .autoconnect() // to start emitting values as soon as the first subscriber subscribes to it
    .sink { timestamp in
        print("Timestamp: \(timestamp)")
    }

/*
    2. DeviceOrientationPublisher
        - publish an event at every interval (ex: every 1 second)
*/
