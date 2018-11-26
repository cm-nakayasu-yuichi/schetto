//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

protocol EventPresenterProtocol: class {
    
    var view: EventViewProtocol! { get set }
    var interactor: EventInteractorInput! { get set }
}

protocol EventViewProtocol: class {
    
}

class EventPresenter: EventPresenterProtocol {
    
    weak var view: EventViewProtocol!
    
    var interactor: EventInteractorInput!
}

extension EventPresenter: EventInteractorOutput {
	
}
