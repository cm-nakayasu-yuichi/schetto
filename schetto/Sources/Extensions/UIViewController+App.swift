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
