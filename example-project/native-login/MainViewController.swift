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

class MainViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.addTabBarItem(titleName: "App", imageName: "app", viewController: ViewController())
    }
    
    private func addTabBarItem(titleName: String, imageName: String, viewController: UIViewController) {
        let tabBarItem = UITabBarItem(title: titleName, image: UIImage(named: "\(imageName)"), selectedImage: UIImage(named: "\(imageName)"))
        viewController.tabBarItem = tabBarItem
        
        if self.viewControllers == nil {
            self.viewControllers = [viewController]
        } else {
            self.viewControllers?.append(viewController)
        }
    }
}

class ViewController: UIViewController {
    
    let titleLabel: UILabel = UILabel.init()
    let subtitleLabel: UILabel = UILabel.init()
    let logoutButton = SPNativeOS11Button.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = SPNativeStyleKit.Colors.customGray
        
        self.titleLabel.text = "Successfully Login"
        self.titleLabel.font = UIFont.system(type: UIFont.BoldType.Regular, size: 23)
        self.titleLabel.numberOfLines = 0
        self.titleLabel.textColor = SPNativeStyleKit.Colors.black
        self.titleLabel.setCenteringAlignment()
        self.view.addSubview(self.titleLabel)
        
        self.subtitleLabel.text = "If you want to start again, please, logout"
        self.subtitleLabel.font = UIFont.system(type: UIFont.BoldType.Regular, size: 15)
        self.subtitleLabel.numberOfLines = 0
        self.subtitleLabel.textColor = SPNativeStyleKit.Colors.gray
        self.subtitleLabel.setCenteringAlignment()
        self.view.addSubview(self.subtitleLabel)
        
        self.logoutButton.setTitle("Logout", for: .normal)
        self.logoutButton.addTarget(self, action: #selector(self.logoutAction), for: .touchUpInside)
        self.view.addSubview(self.logoutButton)
        
        self.updateLayout(with: self.view.frame.size)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        coordinator.animate(alongsideTransition: { (contex) in
            self.updateLayout(with: size)
        }, completion: nil)
    }
    
    override func viewSafeAreaInsetsDidChange() {
        if #available(iOS 11.0, *) {
            super.viewSafeAreaInsetsDidChange()
            self.updateLayout(with: self.view.frame.size)
        }
    }
    
    private func updateLayout(with size: CGSize) {
        let contentWidth = size.width * 0.6
        self.titleLabel.setWidth(contentWidth)
        self.titleLabel.sizeToFit()
        
        self.subtitleLabel.setWidth(contentWidth)
        self.subtitleLabel.sizeToFit()
        
        self.logoutButton.sizeToFit()
        
        let baseSpace: CGFloat = 20
        let allNeedHeight: CGFloat = self.titleLabel.frame.height + self.subtitleLabel.frame.height + self.logoutButton.frame.height + (baseSpace * 2)
        
        self.titleLabel.frame.origin.y = (size.height - allNeedHeight) / 2
        self.titleLabel.center.x = size.width / 2
        
        self.subtitleLabel.frame.origin.y = self.titleLabel.frame.bottomYPosition + baseSpace / 2
        self.subtitleLabel.center.x = size.width / 2
        
        self.logoutButton.frame.origin.y = self.subtitleLabel.frame.bottomYPosition + baseSpace
        self.logoutButton.center.x = size.width / 2
    }
    
    @objc func logoutAction() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = LoginNavigationController()
    }
}
