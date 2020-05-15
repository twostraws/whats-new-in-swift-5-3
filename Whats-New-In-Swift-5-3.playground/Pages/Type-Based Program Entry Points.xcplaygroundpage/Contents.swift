/*:


&nbsp;

[< Previous](@previous)           [Home](Introduction)           [Next >](@next)
# Type-Based Program Entry Points

[SE-0281](https://github.com/apple/swift-evolution/blob/master/proposals/0281-main-attribute.md) introduces a new `@main` attribute to allow us to declare where the entry point for a program is. This allows us to control exactly which part of our code should start running, which is particularly useful for command-line programs.

For example, when creating a terminal app previously we needed to create a file called main.swift that was able to bootstrap our code:
*/
struct OldApp {
    func run() {
        print("Running!")
    }
}
    
let app = OldApp()
app.run()
/*:
Swift automatically considered code in main.swift to be top-level code, so it would create the `App` instance and run it. That is still the case even after SE-0281, but now if you want to you can remove main.swift and instead use the `@main` attribute to mark a struct or base class that contains a static `main()` method to be used as the program’s entry point:
*/
@main
struct NewApp {
    static func main() {
        print("Running!")
    }
}
/*:
When that runs, Swift will automatically call `NewApp.main()` to start your code.

The new `@main` attribute will be familiar to UIKit and AppKit developers, where we use `@UIApplicationMain` and `@NSApplicationMain` to mark our app delegates.

However, there are some provisos you should be aware of when using `@main`:

- You may not use this attribute in an app that already has a main.swift file.
- You may not have more than one `@main` attribute
- The `@main` attribute can be applied only to a base class – it will *not* be inherited by any subclasses.

&nbsp;

[< Previous](@previous)           [Home](Introduction)           [Next >](@next)
*/