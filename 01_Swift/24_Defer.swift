
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

// stack:  A B C D
// print:  

deferTest()