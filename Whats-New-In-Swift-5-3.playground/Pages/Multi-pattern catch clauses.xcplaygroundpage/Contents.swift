/*:


&nbsp;

[< Previous](@previous)           [Home](Introduction)           [Next >](@next)
# Multi-pattern catch clauses

[SE-0276](https://github.com/apple/swift-evolution/blob/master/proposals/0276-multi-pattern-catch-clauses.md) introduced the ability to catch multiple error cases inside a single `catch` block, which allows us to remove some duplication in our error handling.

For example, we might have some code that defines two enum cases for an error:
*/
enum TemperatureError: Error {
    case tooCold, tooHot
}
/*:
When reading the temperature of something, we can either throw one of those errors, or send back “OK”:
*/
func getReactorTemperature() -> Int {
    90
}
    
func checkReactorOperational() throws -> String {
    let temp = getReactorTemperature()
    
    if temp < 10 {
        throw TemperatureError.tooCold
    } else if temp > 90 {
        throw TemperatureError.tooHot
    } else {
        return "OK"
    }
}
/*:
When it comes to *catching* errors thrown there, SE-0276 lets us handle both `tooHot` and `tooCold` in the same way by separating them with a comma:
  
*/
do {
    let result = try checkReactorOperational()
    print("Result: \(result)")
} catch TemperatureError.tooHot, TemperatureError.tooCold {
    print("Shut down the reactor!")
} catch {
    print("An unknown error occurred.")
}
/*:
You can handle as many error cases as you want, and you can even bind values from your errors if needed.

&nbsp;

[< Previous](@previous)           [Home](Introduction)           [Next >](@next)
*/