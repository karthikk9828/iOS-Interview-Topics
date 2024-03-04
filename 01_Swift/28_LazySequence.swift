
/**
In Swift, a lazy sequence is a sequence that delays the execution of its elements until they are needed. 
It is particularly useful when working with large sequences or sequences with expensive operations, 
as it allows you to defer the computation until the values are actually requested.
*/

let numbers = [1, 2, 3, 4, 5]

let lazyMapped = numbers.lazy.map { $0 * 2 } // map function is not performed until lazyMapped is accessed

print(Array(lazyMapped)) // [2, 4, 6, 8, 10]