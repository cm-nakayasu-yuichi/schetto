//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class DesignFontSettingViewController: UIViewController {

    var presenter: DesignFontSettingPresenterProtocol!
    
    @IBOutlet private weak var closeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func didTapCloseButton() {
        // NOP.
    }
}

extension DesignFontSettingViewController: DesignFontSettingViewProtocol {

}
