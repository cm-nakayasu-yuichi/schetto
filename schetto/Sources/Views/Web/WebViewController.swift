//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit
import WebKit

class WebViewController: UIViewController {
    
    var presenter: WebPresenterProtocol!
    var initialUrlString: String!
    
    @IBOutlet private weak var webView: WKWebView!
    @IBOutlet private weak var urlLabel: UILabel!
    @IBOutlet private weak var progressView: UIView!
	@IBOutlet private weak var progressViewWidth: NSLayoutConstraint!
    @IBOutlet private weak var prevButton: UIBarButtonItem!
    @IBOutlet private weak var nextButton: UIBarButtonItem!
    @IBOutlet private weak var shareButton: UIBarButtonItem!
	@IBOutlet private weak var urlArea: UIView!
	@IBOutlet private weak var toolbar: UIToolbar!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCloseButtonOnNavigationBar()
		
		urlArea.dropShadowBottom()
		toolbar.dropShadowTop()
		
        webView.navigationDelegate = presenter
        webView.uiDelegate = presenter
        webView.allowsBackForwardNavigationGestures = true
		presenter.setup(webView: webView)
		
		show(pageUrl: "")
		show(pageTitle: "")
		show(canBack: false, canNext: false)
		show(progressLoading: 0)
		
		presenter.load(urlString: initialUrlString)
    }

	@objc private func didTapReloadButtonOnNavigationBar() {
		presenter.reload()
	}
	
	@objc private func didTapStopButtonOnNavigationBar() {
		presenter.stopLoading()
	}
	
    @IBAction private func didTapPrevButton() {
        presenter.back()
    }
    
    @IBAction private func didTapNextButton() {
        presenter.foeward()
    }
    
    @IBAction private func didTapShareButton() {
        // NOP.
    }
}

extension WebViewController: WebViewProtocol {
	
    func startLoading() {
		show(canBack: false, canNext: false)
		self.progressView.alpha = 1
    }
	
	func show(pageTitle: String) {
		title = pageTitle
	}
	
	func show(pageUrl: String) {
		urlLabel.text = pageUrl
	}
	
	func show(progressLoading progressing: CGFloat) {
		UIView.animate(withDuration: 0.1) {
			let parentWidth = self.progressView.parent!.width
			self.progressViewWidth.constant = parentWidth * progressing
			self.view.layoutIfNeeded()
		}
	}
	
    func finishLoading() {
		UIView.animate(withDuration: 0.8) {
			self.progressView.alpha = 0
			self.view.layoutIfNeeded()
		}
    }
	
	func showWebView() {
		webView.isHidden = false
	}
    
    func showError() {
        webView.isHidden = true
    }
    
    func show(canBack: Bool, canNext: Bool) {
        prevButton.isEnabled = canBack
		nextButton.isEnabled = canNext
    }
	
	func showReload() {
		let button = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(didTapReloadButtonOnNavigationBar))
		navigationItem.rightBarButtonItem = button
	}
	
	func showStopLoading() {
		let button = UIBarButtonItem(barButtonSystemItem: .pause, target: self, action: #selector(didTapStopButtonOnNavigationBar))
		navigationItem.rightBarButtonItem = button
	}
}
