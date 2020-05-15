/*:


&nbsp;

[< Previous](@previous)           [Home](Introduction)           [Next >](@next)
# Multiple trailing closures

[SE-0279](https://github.com/apple/swift-evolution/blob/master/proposals/0279-multiple-trailing-closures.md) introduced multiple trailing closures, making for a simpler way to call a function with several closures.

This will be particularly welcome in SwiftUI, where code like this:
*/
struct OldContentView: View {
    @State private var showOptions = false
    
    var body: some View {
        Button(action: {
            self.showOptions.toggle()
        }) {
            Image(systemName: "gear")
        }
    }
}
/*:
Can now be written as this:
*/
struct NewContentView: View {
    @State private var showOptions = false
    
    var body: some View {
        Button {
            self.showOptions.toggle()
        } label: {
            Image(systemName: "gear")
        }
    }
}
/*:
Technically there is no reason why `label:` needs to be on the same line as the preceding `}`, so you could even write this if you wanted:
*/
struct BadContentView: View {
    @State private var showOptions = false
    
    var body: some View {
        Button {
            self.showOptions.toggle()
        }
    
    
        label: {
            Image(systemName: "gear")
        }
    }
}
/*:
However, I would caution against that for readability – a floating piece of code like that is never pleasant, and in Swift it looks like a labeled block rather than a second parameter to the `Button` initializer.

&nbsp;

[< Previous](@previous)           [Home](Introduction)           [Next >](@next)
*/