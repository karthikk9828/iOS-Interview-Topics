
func deferTest() {
    defer {
        print("A")
    }

    defer {
        print("B")
        defer {
            print("C")
        }
        print("D")
    }

    defer {
        print("E")
    }

    print("F")
}

// defer blocks exexute after everything inside the function has been executes, defer can be used for cleaning up any resources used within the function
// defer blocks are executed in reverse order (added to stack just like function calls)

deferTest()

// defer can be used inside closure as well, works same as functions

let closure = {
    defer {
        print("2")
    }
    print("1")
}

closure()