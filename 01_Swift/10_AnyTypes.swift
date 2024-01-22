
/**

    AnyObject 
        is a protocol that represents an instance of any class type. 
        It is used when you want to work with values of any class type, including class instances and class types themselves.
    
    Any 
        is a protocol that represents an instance of any type, including class types, structure types, enumerations, and protocols.


*/

var object: AnyObject
object = "This is a string" as AnyObject

var value: Any
value = 42
value = "This is a string"

let a = ["hello", 1.2, true, 10]
print(a)

var b: any
b = 2

