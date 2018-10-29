//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class TestViewController: UIViewController {
    
    @IBOutlet private weak var closeButton: UIButton!
    
    @IBOutlet private weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        _ = textField.addConstraint(top: 16, trailing: -16, bottom: nil, leading: 16, to: self.view.safeAreaLayoutGuide)
        _ = textField.addConstraint(height: 40)
    }
    
    @IBAction private func didTapCloseButton() {
        
    }
}
