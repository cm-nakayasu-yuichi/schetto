//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation
import WebKit

protocol WebPresenterProtocol: WKNavigationDelegate, WKUIDelegate {
    
    var view: WebViewProtocol! { get set }
}

protocol WebViewProtocol: class {
    
    func startLoading()
    func progressLoading(progressing: CGFloat)
    func finishLoading(pageTitle: String, pageUrlString: String)
    func showError()
    func updateNavigation(canBack: Bool, canNext: Bool)
}

class WebPresenter: NSObject, WebPresenterProtocol {
    
    weak var view: WebViewProtocol!
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
    }
}
