import Foundation

class MyClass1 {
    static var count = 10
}

class MyClass2: MyClass1 {
    // static var count = 20

    func update() {
        MyClass1.count = 100
    }
}

MyClass2().update()

print(MyClass1.count)
// print(MyClass2.count)