//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class MainMonthlyViewController: UIViewController {
    
    var presenter: MainMonthlyPresenterProtocol!

    @IBOutlet private weak var closeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func didTapCloseButton() {
        // NOP.
    }
}

extension MainMonthlyViewController: MainMonthlyViewProtocol {
    
}
