import Foundation

//MARK: - Method 1 - Using @objc optional

@objc protocol MyProtocol {
    func requiredMethod()

    @objc optional func optionalMethod()
}

class MyClass1: MyProtocol {
    func requiredMethod() {

    }
}

//MARK: - Method 2 - Using extension

protocol MyProtocol2 {
    func requiredMethod()
}

extension MyProtocol2 {
    // add empty implementation
    func optionalMethod() { }
}

class MyClass2: MyProtocol2 {
    func requiredMethod() {
        
    }
}