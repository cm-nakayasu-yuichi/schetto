//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

protocol WebPresenterProtocol: class {
    
    var view: WebViewProtocol! { get set }
}

protocol WebViewProtocol: class {
    
}

class WebPresenter: WebPresenterProtocol {
    
    weak var view: WebViewProtocol!
}
