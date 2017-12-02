// The MIT License (MIT)
// Copyright © 2017 Ivan Vorobei (hello@ivanvorobei.by)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit

class LoginNavigationController: SPNativeLoginNavigationController {
    
    //Mark: - Actions
    override func login(with login: String, password: String, complection: @escaping (SPOauthState) -> ()) {
        delay(2) {
            complection(SPOauthState.needTwoFactor)
        }
    }
    
    override func login(with code: String, complection: @escaping (SPOauthState) -> ()) {
        delay(2) {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = MainViewController()
        }
    }
    
    //Mark: - Content
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
    
    override var loginCodeContent: SPNativeLoginNavigationController.LoginCodeContent {
        return LoginCodeContent(
            navigationTitle: "Auth Code",
            codeTitle: "Code",
            codePlaceholder: "Required",
            codeKeyboardType: UIKeyboardType.numberPad,
            commentTitle: "Please enter a code for authentication",
            buttonTitle: "Sign In",
            errorOauthTitle: "Error",
            errorOauthSubtitle: "Invalid data",
            errorOauthButtonTitle: "Ok"
        )
    }
}
