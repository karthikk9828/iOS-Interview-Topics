
/*

Instructions to look for reference of the function for execution  

Static dipsatch
    1. Direct dispatch
        Used when a method is not changed in the later stage (function overriding)
        So for value types(struct) direct dispatch is used since they do not support inheritence
        Also if a class is final it will use direct dispatch

Dynamic dipsatch
    Used when the method may be changed in the later stage (function overriding)
    So for reference types(class) dynamic dispatch is used since they do not support inheritence
    Also if a class is final it will use direct dispatch
    1. Table dispatch - uses a witness table for each class / subclass with address of each method
    2. Message dispatch

*/

// uses dynamic dispatch since it is a reference type and may have function overriding later by subclassing
class Sam {
    func doWork() {
        print("Sam did some work")
    }
}

// uses static dispatch since it is a value type and will not have function overriding later by subclassing
struct Kev {
    func doWork() {
        print("Kev did some work")
    }
}

// uses static dispatch since it is a value type and will not have function overriding later by subclassing
final class Pete {
    func doWork() {
        print("Pete did some work")
    }
}