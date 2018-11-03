//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit
import WebKit

class WebViewController: UIViewController {
    
    var presenter: WebPresenterProtocol!
    var initialUrlString: String = "https://www.apple.com"
    
    @IBOutlet private weak var webView: WKWebView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var urlLabel: UILabel!
    @IBOutlet private weak var progressView: UIView!
    @IBOutlet private weak var closeButton: UIButton!
    @IBOutlet private weak var reloadButton: UIButton!
    @IBOutlet private weak var prevButton: UIButton!
    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var stopButton: UIButton!
    @IBOutlet private weak var shareButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = presenter
        webView.uiDelegate = presenter
        webView.allowsBackForwardNavigationGestures = true
        load(initialUrlString)
    }
    
    private func load(_ urlString: String) {
        if let url = try? urlString.asURL() {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    @IBAction private func didTapCloseButton() {
        Wireframe.dismiss(from: self)
    }
    
    @IBAction private func didTapReloadButton() {
        // NOP.
    }
    
    @IBAction private func didTapPrevButton() {
        // NOP.
    }
    
    @IBAction private func didTapNextButton() {
        // NOP.
    }
    
    @IBAction private func didTapStopButton() {
        // NOP.
    }
    
    @IBAction private func didTapShareButton() {
        // NOP.
    }
}

extension WebViewController: WebViewProtocol {
    
    func startLoading() {
        
    }
    
    func progressLoading(progressing: CGFloat) {
        
    }
    
    func finishLoading(pageTitle: String, pageUrlString: String) {
        
    }
    
    func showError() {
        
    }
    
    func updateNavigation(canBack: Bool, canNext: Bool) {
        
    }
}
