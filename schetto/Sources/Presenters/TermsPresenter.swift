//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

protocol TermsPresenterProtocol: class {
    
    var view: TermsViewProtocol! { get set }
    
    func requestSetFirstLaunch()
    func requestSetAgree()
}

protocol TermsViewProtocol: class {
    
    func showMain()
}

class TermsPresenter: TermsPresenterProtocol {
    
    weak var view: TermsViewProtocol!
    
    func requestSetFirstLaunch() {
        
    }
    
    func requestSetAgree() {
        view.showMain()
    }
}
