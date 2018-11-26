//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

protocol MainMonthlyPresenterProtocol: class {
    
    var view: MainMonthlyViewProtocol! { get set }
    var interactor: MainMonthlyInteractorInput! { get set }
}

protocol MainMonthlyViewProtocol: class {
    
}

class MainMonthlyPresenter: MainMonthlyPresenterProtocol {
    
    weak var view: MainMonthlyViewProtocol!
    
    var interactor: MainMonthlyInteractorInput!
}

extension MainMonthlyPresenter: MainMonthlyInteractorOutput {
	
}
