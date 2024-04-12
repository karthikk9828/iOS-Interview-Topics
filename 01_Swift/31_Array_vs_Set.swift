
import Foundation

/**

    Array                                               Set
    -------------------------------------------         --------------------------------------------
    Can store duplicates                                Cannot store duplicates

    Ordered                                             Unordered (order is different everytime we access the set)

    Lookup / search is O(N)                             Lookup is O(1), efficient for very large input
*/

// ---------------------- Set Operations ----------------------

var swiftUIDevs: Set = ["Sean", "James"]
var swiftDevs: Set = ["Sean", "James", "Olivia", "Mathew", "Leo"]
var kotlinDevs: Set = ["Olivia", "Ethan", "Leo", "Mathew", "Dan"]
var experiencedDevs: Set = ["Sean", "Ava", "Olivia", "Leo", "Mathew"]

// Intersection - find overlapping

let experiencedSwiftUIDevs = swiftUIDevs.intersection(experiencedDevs)
print(experiencedSwiftUIDevs)

// Subraction - find difference

let juniorSwiftDevs = swiftDevs.subtracting(experiencedDevs)
print(juniorSwiftDevs)

// Disjoint - check for overlapping

let hasNoOverlap = swiftDevs.isDisjoint(with: kotlinDevs)
print(hasNoOverlap)

// Union - combine

let iosDevs = swiftDevs.union(swiftUIDevs)
print(iosDevs)

// Exclusive - only 1 in set

let specialists = swiftDevs.symmetricDifference(kotlinDevs)
print(specialists)

// Subset 
let isSubset = swiftUIDevs.isSubset(of: swiftDevs)
print(isSubset)

// Superset

let isSuperset = swiftDevs.isSuperset(of: swiftUIDevs)
print(isSuperset)

// Insert, Delete, Find

swiftDevs.insert("John")
print(swiftDevs)

swiftDevs.remove("John")

print(swiftDevs.contains("John"))