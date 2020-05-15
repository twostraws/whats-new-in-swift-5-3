/*:


&nbsp;

[< Previous](@previous)           [Home](Introduction)           [Next >](@next)
# New collection methods on noncontiguous elements

[SE-0270](https://github.com/apple/swift-evolution/blob/master/proposals/0270-rangeset-and-collection-operations.md) introduces a new `RangeSet` type that can represent any number of positions in a collection. This might sound fairly simple, but it actually enables some highly optimized functionality that will prove useful in many programs.

For example, if we had an array of names like this:
*/
var names = [
    "Eleanor",
    "Chidi",
    "Tahani",
    "Jianyu",
    "Michael",
    "Janet"
]
/*:
We could get a `RangeSet` containing the locations of all names that being with J:
*/
let jNames = names.subranges(where: { $0.hasPrefix("J") })
/*:
That won’t return the names themselves, only their locations in the `names` array.

As the name implies, `RangeSet` implements a subset of the `SetAlgebra` protocol, allowing us to create unions, intersections, subsets, and more, while also checking whether a `RangeSet` contains specific items.

So, we could create a second range set then combine the two together like this:
*/
let mNames = names.subranges(where: { $0.hasPrefix("M") })
let combinedNames = jNames.union(mNames)
/*:
You can also use `contains()`, but note that has a complexity of **O(log *n*)** compared to the **O(1)** from a regular `Set`.

The new `RangeSet` type has been fully integrated into the rest of the standard library, allowing us to use it for subscripting collections. For example, if we had an array of numbers like this:
*/
 let numbers = [-4, 8, -15, 16, -23, 42]
 
/*:
 Then we could pull out all the positive numbers, sum them, the print information about how many we found and their sum:
 
*/
 let positiveSubranges = numbers.subranges { $0 > 0 }
 let positiveSum = numbers[positiveSubranges].reduce(0, +)
 print("There are \(numbers[positiveSubranges].count) positive numbers, totaling \(positiveSum)")
/*:
Perhaps most usefully of all, this change gives us a new `moveSubranges(_:to:)` method for moving all items in a `RangeSet` to a particular point in a mutable collection, while preserving the order of the items you’re moving. So, this will move all our positive numbers to the end of the array:
*/
numbers.moveSubranges(positiveSubranges, to: numbers.endIndex)
/*:
This method will return the new indices of the objects, so you can see where they were individually moved to.

&nbsp;

[< Previous](@previous)           [Home](Introduction)           [Next >](@next)
*/