/*:


&nbsp;

[< Previous](@previous)           [Home](Introduction)           [Next >](@next)
# Enum cases as protocol witnesses

[SE-0280](https://github.com/apple/swift-evolution/blob/master/proposals/0280-enum-cases-as-protocol-witnesses.md) allows enums to participate in protocol witness matching, which is a technical way of saying they can now match requirements of protocols more easily.

For example, you could write code to handle various types of data, but what if that data were missing? Sure, you could use something like nil coalescing to provide a default value every time, but you could also make a protocol that requires a default value, then make various types conform to it with whatever default values you wanted:
*/
protocol Defaultable {
    static var defaultValue: Self { get }
}
    
// make integers have a default value of 0
extension Int: Defaultable {
    static var defaultValue: Int { 0 }
}
    
// make arrays have a default of an empty array
extension Array: Defaultable {
    static var defaultValue: Array { [] }
}
    
// make dictionaries have a default of an empty dictionary
extension Dictionary: Defaultable {
    static var defaultValue: Dictionary { [:] }
}
/*:
What SE-0280 allows us to do is exactly the same thing just for enums. For example, you want to create a `padding` enum that can take some number of pixels, some number of centimeters, or a default value decided by the system:
*/
enum Padding: Defaultable {
    case pixels(Int)
    case cm(Int)
    case defaultValue
}
/*:
That kind of code wouldn’t have been possible before SE-0280 – Swift would have said that `Padding` doesn’t satisfy the protocol. However, if you think it through the protocol really *is* satisfied: we said it needs a static `defaultValue` that returns `Self`, i.e. whatever concrete type is conforming to the protocol, and that’s exactly what `Padding.defaultValue` does.

&nbsp;

[< Previous](@previous)           [Home](Introduction)           [Next >](@next)
*/