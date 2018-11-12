//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

struct TextViewControllerOptions {
    let title: String
    let placeholder: String
    let text: String
    let multiLine: Bool
}

class TextViewController: UIViewController {
    
    typealias Handler = (String) -> ()
    
    @IBOutlet private weak var okButton: UIButton!
    @IBOutlet private weak var textView: UITextView!
    @IBOutlet private weak var placeholderLabel: UILabel!
    @IBOutlet private weak var bottomConstraint: NSLayoutConstraint!
    
    var options: TextViewControllerOptions!
    var handler: Handler!
    
    private var keyboard: KeyboardManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = options.title
        
        textView.text = options.text
        textView.delegate = self
        
        placeholderLabel.text = options.placeholder
        placeholderLabel.isHidden = !textView.text.isEmpty
        
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

extension TextViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
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
