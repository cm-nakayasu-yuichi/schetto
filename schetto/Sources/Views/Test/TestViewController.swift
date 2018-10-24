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
        Wireframe.showConfirmDeleteEvent(from: self) {
            print("削除")
        }
    }
}
