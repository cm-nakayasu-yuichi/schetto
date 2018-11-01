//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit
import WebKit

class TermsViewController: UIViewController {
    
    var presenter: TermsPresenterProtocol!

    @IBOutlet private weak var webView: WKWebView!
    @IBOutlet private weak var agreeCheckButton: UIButton!
    @IBOutlet private weak var agreeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "利用規約"
    }
    
    @IBAction private func didTapAgreeCheckButton() {
        // NOP.
    }
    
    @IBAction private func didTapAgreeButton() {
        // NOP.
    }
}

extension TermsViewController: TermsViewProtocol {
    
    func showMain() {
        
    }
}
