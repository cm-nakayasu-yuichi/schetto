//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

protocol MainPresenterProtocol: class {
    
    var view: MainViewProtocol! { get set }
    var interactor: MainInteractorInput! { get set }
}

protocol MainViewProtocol: class {
    
}

class MainPresenter: MainPresenterProtocol {
    
    weak var view: MainViewProtocol!
    
    var interactor: MainInteractorInput!
}

extension MainPresenter: MainInteractorOutput {
	
}
