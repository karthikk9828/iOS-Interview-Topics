
/**
    Copy On write
        Says that if two objects are supposed to hold exactly same values 
        then both of them should be pointing to the same object unless mutation is needed

        Swift has implemented copy-on-write for Arrays and Dictionaries but not for the custom objects
        but we can implement it on our own
*/

var a = [1, 2]
var b = a 
// now both a and b are pointing to the same object [1, 2] in memory

print(a)
print(b)

// print address, will be same for both a and b
a.withUnsafeBufferPointer { pointer in
    print(pointer)
}
b.withUnsafeBufferPointer { pointer in
    print(pointer)
}

a.append(3) // mutate
// when a mutation happens a copy of this object is created

print(a)
print(b)

// print address, will be different for a and b
a.withUnsafeBufferPointer { pointer in
    print(pointer)
}
b.withUnsafeBufferPointer { pointer in
    print(pointer)
}

// now a is pointing to [1, 2, 3] 
// now b is pointing to [1, 2]   , these are two different objects


// ------------------------------------------------------------------------
// Swift has implemented copy-on-write for Arrays and Dictionaries but not for the custom objects

struct MyStruct {
    var name: String
}

var s1 = MyStruct(name: "John")
var s2 = s1
// s1 and s2 are pointing to different objects in memory
