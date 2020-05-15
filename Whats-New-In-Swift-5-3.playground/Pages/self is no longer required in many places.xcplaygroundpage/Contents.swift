/*:


&nbsp;

[< Previous](@previous)           [Home](Introduction)           [Next >](@next)
# `self` is no longer required in many places

[SE-0269](https://github.com/apple/swift-evolution/blob/master/proposals/0269-implicit-self-explicit-capture.md) allows us to stop using `self` in many places where it isn’t necessary. Prior to this change, we’d need to write `self.` in any closure that referenced `self` so we were making our capture semantics explicit, however often it was the case that our closure could not result in a reference cycle, meaning that the `self` was just clutter.

For example, before this change we would write code like this:
*/
struct OldContentView: View {
    var body: some View {
        List(1..<5) { number in
            self.cell(for: number)
        }
    }
    
    func cell(for number: Int) -> some View {
        Text("Cell \(number)")
    }
}
/*:
That call to `self.cell(for:)` cannot cause a reference cycle, because it’s being used inside a struct. Thanks to SE-0269, we can now write the same code like this:
*/
struct NewContentView: View {
    var body: some View {
        List(1..<5) { number in
            cell(for: number)
        }
    }
    
    func cell(for number: Int) -> some View {
        Text("Cell \(number)")
    }
}
/*:
This is likely to be extremely popular in any framework that makes heavy use of closures, including SwiftUI and Combine.

&nbsp;

[< Previous](@previous)           [Home](Introduction)           [Next >](@next)
*/