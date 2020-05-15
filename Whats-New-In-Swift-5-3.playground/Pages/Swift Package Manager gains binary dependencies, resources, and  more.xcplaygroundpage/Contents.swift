/*:


&nbsp;

[< Previous](@previous)           [Home](Introduction)
# Swift Package Manager gains binary dependencies, resources, and  more

Swift 5.3 introduced many improvements for Swift Package Manager (SPM). Although it’s not possible to give hands-on examples of these here, we can at least discuss what has changed and why.

First, [SE-0271](https://github.com/apple/swift-evolution/blob/master/proposals/0271-package-manager-resources.md) (Package Manager Resources) allows SPM to contain resources such as images, audio, JSON, and more. This is more than just copying files into a finished app bundle – for example, we can apply a custom processing step to our assets, such as optimizing images for iOS. This also adds a new `Bundle.module` property for accessing these assets at runtime. [SE-0278](https://github.com/apple/swift-evolution/blob/master/proposals/0278-package-manager-localized-resources.md) (Package Manager Localized Resources) builds on this to allow for localized versions of resources, for example images that are in French.

Second, [SE-0272](https://github.com/apple/swift-evolution/blob/master/proposals/0272-swiftpm-binary-dependencies.md) (Package Manager Binary Dependencies) allows SPM to use binary packages alongside its existing support for source packages. This means common closed-source SDKs such as Firebase can now be integrated using SPM.

Third, [SE-0273](https://github.com/apple/swift-evolution/blob/master/proposals/0273-swiftpm-conditional-target-dependencies.md) (Package Manager Conditional Target Dependencies) allows us to configure targets to have dependencies only for specific platforms and configurations. For example, we might say that we need some specific extra frameworks when compiling for Linux, or that we should build in some debug code when compiling for local testing.

It’s worth adding that the “Future Directions” section of SE-0271 mentions the possibility of type-safe access to individual resource files – the ability for SPM to generate specific declarations for our resource files as Swift code, meaning that things like `Image("avatar")` become something like `Image(module.avatar)`.

&nbsp;

[< Previous](@previous)           [Home](Introduction)
*/