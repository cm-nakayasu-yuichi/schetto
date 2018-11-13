//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

extension UIViewController {
    
    func setupCloseButtonOnNavigationBar() {
        let button = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(didTapCloseButtonOnNavigationBar))
        navigationItem.leftBarButtonItem = button
    }
    
    @objc func didTapCloseButtonOnNavigationBar() {
        Wireframe.dismiss(from: self)
    }
}

extension UIViewController {
    
    func setupAddButtonOnNavigationBar() {
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAddButtonOnNavigationBar))
        navigationItem.rightBarButtonItem = button
    }
    
    @objc func didTapAddButtonOnNavigationBar() {
        
    }
}
