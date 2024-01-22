
// Imagine we don't have map() function given by apple, write a map function

let arr = [1, 2, 3]
print(arr.map { $0 * 2 })

func myMap<T>(_ elements: [T], _ transform: (T) -> (T)) -> [T] {
    var result = [T]()
    for element in elements {
        result.append(transform(element))
    }
    return result
}

print(myMap(arr) { $0 + 1 })

extension Collection {
    func myMap<T>(_ transform: (T) -> (T)) -> [T] {
        var result = [T]()
        for element in self {
            result.append(transform(element as! T))
        }
        return result
    }
}

print(arr.myMap { $0 + 1 })
