//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class TextViewController: UIViewController {
    
    @IBOutlet private weak var okButton: UIButton!
    @IBOutlet private weak var textView: UITextView!
    @IBOutlet private weak var bottomConstraint: NSLayoutConstraint!
    
    private var keyboard: KeyboardManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        keyboard = KeyboardManager(delegate: self)
        setupCloseButtonOnNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textView.becomeFirstResponder()
    }
    
    @IBAction private func didTapOkButton() {
        // NOP.
    }
}

extension TextViewController: KeyboardManagerDelegate {
    
    func keyboardManager(_ keyboardManager: KeyboardManager, willChange frame: CGRect) {
        bottomConstraint.constant = frame.height - .safeAreaBottom(self)
        view.layoutIfNeeded()
    }
    
    func keyboardManager(_ keyboardManager: KeyboardManager, didChange frame: CGRect) {
    }
}
