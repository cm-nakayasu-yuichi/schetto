//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class LaunchViewController: UIViewController {
    
    var presenter: LaunchPresenterProtocol!

    @IBOutlet private weak var closeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func didTapCloseButton() {
        // NOP.
    }
}

extension LaunchViewController: LaunchViewProtocol {
    
}
