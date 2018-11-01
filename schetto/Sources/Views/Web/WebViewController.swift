//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class WebViewController: UIViewController {
    
    var presenter: WebPresenterProtocol!

    @IBOutlet private weak var closeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func didTapCloseButton() {
        // NOP.
    }
}

extension WebViewController: WebViewProtocol {
    
}
