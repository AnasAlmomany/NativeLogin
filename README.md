<img src="https://cdn.rawgit.com/IvanVorobei/NativeLogin/9a0aafd0/resources/native-login%20-%20baner%20-%20outline.svg"/>

## About
This project simplifies work with forms of authorization and uses native elements that Apple recommends and uses. It may seem that such elements are ready in the system, but as it turned out - no. I did a lot of work to repeat the visual reference

<img src="https://cdn.rawgit.com/IvanVorobei/NativeLogin/4e905663/resources/native-login%20-%20mockup_preview.gif" width="600">

[please, wait loading animated preview]

## Requirements
Xcode 9 and Swift 4. Ready for use on iOS 9+

## Integration
Drop in `Sparrow` folder to your Xcode project (make sure to enable "Copy items if needed" and "Create groups").

Or via CocoaPods:
```ruby
pod 'Sparrow', :git => 'https://github.com/IvanVorobei/Sparrow.git'
```
## How to use
Create new class with name `LoginNavigationController` and inherit `SPNativeLoginNavigationController`
```swift
class LoginNavigationController: SPNativeLoginNavigationController {}
```
You must implement in `LoginNavigationController` the next functions (otherwise get fatal error):
```swift
override func login(with login: String, password: String, complection: @escaping (SPOauthState) -> ()) {

}
    
override func login(with code: String, complection: @escaping (SPOauthState) -> ()) {

}
```
Inside the functions, you should do the work with authorization (for example, http requests) and at the end of authorization call the package. Pass in complection status of authorization

<img src="https://cdn.rawgit.com/IvanVorobei/NativeLogin/9937ab4f/resources/native-login%20-%20promo.jpg"/>

## Customize
If you want to customize the content (keyboard type or text) you should ovveride property 
```swift
class LoginNavigationController: SPNativeLoginNavigationController {

    override var loginContent: SPNativeLoginNavigationController.LoginContent {
        var content = LoginContent()
        content.navigationTitle = "Sign In"
        content.loginTitle = "Login"
        content.loginPlaceholder = "example@icloud.com"
        content.loginKeyboardType = .emailAddress
        content.passwordTitle = "Password"
        content.passwordPlaceholder = "Required"
        content.commentTitle = "Please enter a pair of login and password"
        content.buttonTitle = "Sign In"
        content.errorOauthTitle = "Error"
        content.errorOauthSubtitle = "Invalid login or password"
        content.errorOauthButtonTitle = "Ok"
        return content
    }
}
```

For CodeController need ovveride `loginCodeContent`. You do not need to override all values, some you can ignore

<img src="https://cdn.rawgit.com/IvanVorobei/NativeLogin/4498acbd/resources/native-login%20-%20screens.jpg"/>

## Questions and Problems
If you have trouble with porject - contact me via email

## You need to develop a UI?
You can contact me and order the development of an application or UI with excellent animations. Contact with me via email: hello@ivanvorobei.by

## Apps, using NativeLogin
I like the idea to specify applications that use the RequestPermission. Please, contact me via email (you can find it in the section "Contacts") so that I added app here

## License
NativeLogin is released under the MIT license. Check LICENSE.md for details

## Other
<img src="https://cdn.rawgit.com/IvanVorobei/RequestPermission/e85814ac/resources/powered_by_sparrow.svg"/>

In the project you can find my library [Sparrow](https://github.com/IvanVorobei/Sparrow). It's a library, on which the module is written. Unfortunately, to save time in development, I wrote NativeLogin using this library. Don't worry, within just Swift files and a lot of useful things. Maybe you will like it:)

## Contact
 
[https://hello.ivanvorobei.by](https://hello.ivanvorobei.by)

[https://ivanvorobei.by](https://hello.ivanvorobei.by) 

hello@ivanvorobei.by

## Support
The project is fully free, I do not impose any restrictions on its use. I'm, just like you, want to do useful things. If you have a desire to help, tell friends about the project or [donate](http://ivanvorobei.by/donate). Thanks!
