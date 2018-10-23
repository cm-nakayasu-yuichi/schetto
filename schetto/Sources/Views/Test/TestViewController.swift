//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class TestViewController: UIViewController {
    
    @IBOutlet private weak var closeButton: UIButton!
    
    @IBOutlet private weak var child: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        _ = child.addConstraint(allSideSpaceTo: nil)
    }
    
    @IBAction private func didTapCloseButton() {
        let vc = Builder().eventEdit()
        let behavior = DialogRiseupBehavior(offset: 10)
        behavior.fixedSize = CGSize(200, 300)
        Dialog.show(vc, from: self, behavior: behavior)
    }
}
