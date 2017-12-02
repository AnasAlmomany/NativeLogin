<img src="https://cdn.rawgit.com/IvanVorobei/RequestPermission/e85814ac/resources/request-permission_baner.svg"/>

## About
This project simplifies work with forms of authorization and uses native elements that Apple recommends and uses. It may seem that such elements are ready in the system, but as it turned out - no. I did a lot of work to repeat the visual reference

<img src="https://cdn.rawgit.com/IvanVorobei/RequestPermission/e85814ac/resources/request-permission%20-%20mockup_preview.gif" width="600">

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
class LoginNavigationController: SPNativeLoginNavigationController {

}
```
You must implement the next functions (otherwise get fatalError):
```swift
    override func login(with login: String, password: String, complection: @escaping (SPOauthState) -> ()) {

    }
    
    override func login(with code: String, complection: @escaping (SPOauthState) -> ()) {

    }
```
Inside the functions, you should do the work with authorization (for example, http requests) and at the end of authorization call the package. Pass in complection status of authorization

## Customize
If you want to customize the content (keyboard type or text) you should ovveride property 
```swift
class LoginNavigationController: SPNativeLoginNavigationController {

    override var loginContent: SPNativeLoginNavigationController.LoginContent {
        return LoginContent(
            navigationTitle: "Sign In",
            loginTitle: "Login",
            loginPlaceholder: "example@icloud.com",
            loginKeyboardType: UIKeyboardType.emailAddress,
            passwordTitle: "Password",
            passwordPlaceholder: "Required",
            commentTitle: "Please enter a pair of login and password",
            buttonTitle: "Sign In",
            errorOauthTitle: "Error",
            errorOauthSubtitle: "Invalid login or password",
            errorOauthButtonTitle: "Ok"
        )
    }
}
```

You do not need to override all values, some you can ignore

## Questions and Problems
If you have trouble with porject - contact me via email

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
