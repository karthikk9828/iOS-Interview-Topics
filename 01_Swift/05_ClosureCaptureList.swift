

// Closure capture list

var language: String = "Obj-C"

// language will contain "Obj-C", it is captured, next time the closure is called, it will still be "Obj-C".
// Even if we update the value of language to "Swift" in line #13, it will still be "Obj-C"
let code = { [language] in
    print(language)
}

language = "Swift"
code() // prints "Obj-C" because value was captured
code() // prints "Obj-C" because value was captured

// to fix the above issue, just remove the closure capture list, everytime the language value will be read
let code1 = {
    print(language) // prints "Swift"
}

code1()

// --------------------------------------------------------------------

// values in capture lists are immutable, we cannot change the value of captured variables inside closure

var text = "hello" 
let closure = { [text] in
    text = "hello updated"
    print(text)
}

closure()

// --------------------------------------------------------------------

class Capture {

    var name = "john"

    var completion: (() -> Void)?

    func setCompletion(_ completion: @escaping () -> Void) {
        self.completion = completion
        print("set completion")
    }

    func finish() {
        // self.completion!()
        setCompletion { [str] in
            // guard let self = self else { return }
            print(str)
        }

        print("calling completion")
        self.completion!()
        print("called completion")
    }
}

var str = "hello"

let capture1 = Capture()
capture1.finish()

// capture1.name = "peter"

capture1.finish()

// let capture2 = Capture()
// capture2.finish()


// ----------- run by selecting part of the code

// Closure capture by value:

var outsideValue = 10

let closureByValue = {
    print(outsideValue) // Captured by value
}

outsideValue = 20 // Changes made after closure creation

closureByValue() // Prints 20

// Capture by reference:

var outsideValue = 10

let closureByReference = { [outsideValue] in
    print(outsideValue) // Captured by reference
}

outsideValue = 20 // Changes made after closure creation

closureByReference() // Prints 10, not 20

 //----------------------------------------------------------------

// closure syntax

let printNum = { (num: Int) -> String in
    return "\(num) as string"
}
print(printNum(1))

var a: (Int, Int, Int) = (1, 2, 3)
print(a)