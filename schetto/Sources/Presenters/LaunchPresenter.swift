//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

protocol LaunchPresenterProtocol: class {
    
    var view: LaunchViewProtocol! { get set }
    var interactor: LaunchInteractorInput! { get set }
}

protocol LaunchViewProtocol: class {
    
}

class LaunchPresenter: LaunchPresenterProtocol {
    
    weak var view: LaunchViewProtocol!
    
    var interactor: LaunchInteractorInput!
}

extension LaunchPresenter: LaunchInteractorOutput {
	
}
