
/**
    If we want to override a static property, we can use class variable

    class BaseClass {
        static staticProperty = 1
    }

    class SubClass: BaseClass {
        override static staticProperty = 2
    }

    Above code will not work, it will throw compilation error.

    In Swift, you cannot directly override static properties as you would with instance properties in subclasses. 
    Static properties belong to the type itself rather than to instances of the type, so they are not part of the inheritance chain.

    However, you can achieve similar behavior by using computed static properties and class inheritance. 
    Here's how you can emulate the behavior of overriding static properties:
*/

class BaseClass {
    class var staticProperty: Int {
        return 0
    }
}

class SubClass: BaseClass {
    override class var staticProperty: Int {
        return 10
    }
}

print(BaseClass.staticProperty) // Output: 0
print(SubClass.staticProperty)  // Output: 10