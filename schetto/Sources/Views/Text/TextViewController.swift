//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class TextViewController: UIViewController {
    
    @IBOutlet private weak var closeButton: UIButton!
    @IBOutlet private weak var textView: UITextView!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    @IBAction private func didTapCloseButton() {
        // NOP.
    }
}
