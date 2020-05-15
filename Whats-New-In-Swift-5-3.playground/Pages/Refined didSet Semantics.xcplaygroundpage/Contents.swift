/*:


&nbsp;

[< Previous](@previous)           [Home](Introduction)           [Next >](@next)
# Refined `didSet` Semantics

[SE-0268](https://github.com/apple/swift-evolution/blob/master/proposals/0268-didset-semantics.md) adjusts the way the `didSet` property observers work so that they are more efficient. This doesn’t require a code change unless you were somehow relying on the previous buggy behavior; you’ll just get a small performance improvement for free.

Internally, this change makes Swift *not* retrieve the previous value when setting a new value in any instance where you weren’t using the old value, and if you don’t reference `oldValue` *and* don’t have a `willSet` Swift will change your data in-place.

If you do happen to be relying on the old behavior, you can work around it simply by referencing `oldValue` to trigger your custom getter, like this:
*/
didSet {
    _ = oldValue
}
/*:

&nbsp;

[< Previous](@previous)           [Home](Introduction)           [Next >](@next)
*/