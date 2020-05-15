/*:


&nbsp;

[< Previous](@previous)           [Home](Introduction)           [Next >](@next)
# Synthesized Comparable conformance for enums

[SE-0266](https://github.com/apple/swift-evolution/blob/master/proposals/0266-synthesized-comparable-for-enumerations.md) lets us opt in to `Comparable` conformance for enums that either have no associated values or have associated values that are themselves `Comparable`. This allows us to compare two cases from the same enum using `<`, `>`, and similar.

For example, if we had an enum that describes clothing sizes we could ask Swift to synthesize `Comparable` conformance like this:
*/
enum Size: Comparable {
    case small
    case medium
    case large
    case extraLarge
}
/*:
We can now create two instances of that enum and compare them using `<`, like this:
*/
let shirtSize = Size.small
let personSize = Size.large
    
if shirtSize < personSize {
    print("That shirt is too small")
}
/*:
This synthesized conformance works great with associated values that are `Comparable`. For example, if we had an enum that described the football World Cup wins for a team, we might write this:
*/
enum WorldCupResult: Comparable {
    case neverWon
    case winner(stars: Int)
}
/*:
We could then create several instances of that enum with varying values, and have Swift sort them:
*/
let americanMen = WorldCupResult.neverWon
let americanWomen = WorldCupResult.winner(stars: 4)
let japaneseMen = WorldCupResult.neverWon
let japaneseWomen = WorldCupResult.winner(stars: 1)
    
let teams = [americanMen, americanWomen, japaneseMen, japaneseWomen]
let sortedByWins = teams.sorted()
print(sortedByWins)
/*:
That will sort the array so that the two teams who haven’t won the World Cup come first, then the Japanese women’s team, then the American women’s team – it considers the two `winner` cases to be higher than the two `neverWon` cases, and considers `winner(stars: 4)` to be higher than `winner(stars: 1)`.

&nbsp;

[< Previous](@previous)           [Home](Introduction)           [Next >](@next)
*/