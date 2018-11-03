//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

protocol DesignFontSettingPresenterProtocol: class {
    
    var view: DesignFontSettingViewProtocol! { get set }
    var interactor: DesignFontSettingInteractorInput! { get set }
}

protocol DesignFontSettingViewProtocol: class {
    
}

class DesignFontSettingPresenter: DesignFontSettingPresenterProtocol {
    
    weak var view: DesignFontSettingViewProtocol!
    
    var interactor: DesignFontSettingInteractorInput!
}

extension DesignFontSettingPresenter: DesignFontSettingInteractorOutput {
	
}
