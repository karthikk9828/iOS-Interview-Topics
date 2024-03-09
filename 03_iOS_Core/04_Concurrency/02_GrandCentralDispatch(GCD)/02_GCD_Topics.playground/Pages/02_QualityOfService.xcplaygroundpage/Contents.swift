//: [Previous](@previous)

import Foundation

/*
    Quality of Service (QoS)
        QoS tells the system about how it should utilize the resources for the job to be executed.
        QoS classes specify the priorities for executing tasks.
 
         userInteractive
            for user-interactive tasks, such as animations, event handling, or updating your app's user interface.
 
         userInitiated
            for tasks that prevent the user from actively using your app or tasks that need immediate results.
 
         utility
            for long running tasks or for tasks that the user does not track actively.

         background
            for tasks not visible to the user or maintenance or cleanup tasks that you create.
 
         default
            The default QoS class.
            Falls between userInitiated and utility.
 
         unspecified
            The absence of a QoS class.
 
    -------------------------------------------------------------------------------
 
    When to use which QoS?
    
     userInteractive
        Updating UI involved?
        Ex: Update any view

     userInitiated
        Data required for seamless user experience?
        Ex: Load more data in tableview

     utility
        Is user aware of the progress?
        Ex: Download

     background
        Is user aware of the task?
        Ex: Any background task / sync
 
    -------------------------------------------------------------------------------
    
    Priority order
 
    1. userInteractive
    2. userInitiated
    3. utility
    4. background
    5. default
    6. unspecified
*/

/*
    Even though .userInteractive QoS is used for updating app's UI or animations, it will not use the main thread.
*/
DispatchQueue.global(qos: .userInteractive).async {
    if Thread.isMainThread {
        print("DispatchQueue.global & QoS: userInteractive: Executing on main thread")
    } else {
        print("DispatchQueue.global & QoS: userInteractive: Executing on global concurrent queue thread")
    }
}

/*
    If there is only one single core in the processor and we want to execute multiple processes,
    internally it will use time slicing and context switching.
    Load the data needed for the first task, execute first task, pre-emption.
    Load the data needed for the second task, execute second task, pre-emption.
    Keep on repeating these steps until the tasks are completed.
*/

//MARK: -------------------------------Code examples------------------------------------------------

// this will be finished second because background has lower priority than userInteractive
// also since this is async block, do not stop the execution, move to the next block of code
DispatchQueue.global(qos: .background).async {
    for i in 11 ... 21 {
        print(i)
    }
}

// this will be finished first because userInteractive has higher priority than background
// more resources will be allocated to this task
DispatchQueue.global(qos: .userInteractive).async {
    for i in 0 ... 10 {
        print(i)
    }
}

/*
    the order of printing numbers might be different everytime because they are running at the same time on different queues
    but userInteractive will get more resources so it will be finished first (print 0 ... 10)
*/

//: [Next](@next)
