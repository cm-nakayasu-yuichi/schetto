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
//        _ = child.addConstraint(height: 50)
//        _ = child.addConstraint(width: 100)
    }
    
    @IBAction private func didTapCloseButton() {
        // NOP.
    }
}
