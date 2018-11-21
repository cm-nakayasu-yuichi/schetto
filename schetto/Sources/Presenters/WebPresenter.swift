//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation
import WebKit

protocol WebPresenterProtocol: WKNavigationDelegate, WKUIDelegate {
    
    var view: WebViewProtocol! { get set }
	
	func setup(webView: WKWebView)
	func load(urlString: String)
	func stopLoading()
	func reload()
	func back()
	func foeward()
}

protocol WebViewProtocol: class {
	
    func startLoading()
	func finishLoading()
	
	func show(pageTitle: String)
	func show(pageUrl: String)
    func show(canBack: Bool, canNext: Bool)
	func show(progressLoading progressing: CGFloat)
	
	func showWebView()
    func showError()
	func showReload()
	func showStopLoading()
}

class WebPresenter: NSObject, WebPresenterProtocol {
    
    weak var view: WebViewProtocol!
	weak var webView: WKWebView?
	
	func setup(webView: WKWebView) {
		self.webView = webView
		webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
	}
	
	deinit {
		webView?.removeObserver(self, forKeyPath: "estimatedProgress")
	}
	
	func load(urlString: String) {
		if let url = try? urlString.asURL() {
			let request = URLRequest(url: url)
			webView?.load(request)
		}
	}
	
	func stopLoading() {
		if webView?.isLoading ?? false {
			webView?.stopLoading()
		}
	}
	
	func reload() {
		webView?.reload()
	}
	
	func back() {
		if webView?.canGoBack ?? false {
			webView?.goBack()
		}
	}
	
	func foeward() {
		if webView?.canGoForward ?? false {
			webView?.goForward()
		}
	}
	
	func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
		view.startLoading()
		view.showStopLoading()
		view.show(canBack: false, canNext: false)
	}
	
	func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
		// nop.
	}
	
	func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
		view.showWebView()
		view.showReload()
		view.show(pageTitle: webView.title ?? "")
		view.show(canBack: webView.canGoBack, canNext: webView.canGoForward)
		view.finishLoading()
	}
	
	func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
		if navigationAction.targetFrame == nil {
			webView.load(navigationAction.request)
		}
		return nil
	}
	
	func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
		view.showError()
		view.showReload()
		view.show(pageTitle: "")
		view.show(canBack: false, canNext: false)
		view.finishLoading()
	}
	
	func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
		self.webView(webView, didFail: navigation, withError: error)
	}
	
	func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
		let urlString = webView.url?.absoluteString ?? ""
		view.show(pageUrl: urlString)
		decisionHandler(.allow)
	}
	
	override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
		if keyPath == "estimatedProgress" {
			let progressing = webView?.estimatedProgress ?? 0
			view.show(progressLoading: progressing.f)
		}
	}
}
