//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

extension UIViewController {
    
    func setRightBarButtonSystemItem(_ systemItem:  UIBarButtonItem.SystemItem, selector: Selector) {
        let button = UIBarButtonItem(barButtonSystemItem: systemItem, target: self, action: selector)
        navigationItem.rightBarButtonItem = button
    }
    
    func setLeftBarButtonSystemItem(_ systemItem:  UIBarButtonItem.SystemItem, selector: Selector) {
        let button = UIBarButtonItem(barButtonSystemItem: systemItem, target: self, action: selector)
        navigationItem.leftBarButtonItem = button
    }
}

extension UIViewController {
    
    func setupCloseButtonOnNavigationBar() {
        setLeftBarButtonSystemItem(.stop, selector: #selector(didTapCloseButtonOnNavigationBar))
    }
    
    @objc func didTapCloseButtonOnNavigationBar() {
        Wireframe.dismiss(from: self)
    }
}
