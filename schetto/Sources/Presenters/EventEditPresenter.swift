//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

protocol EventEditPresenterProtocol: class {
    
    var view: EventEditViewProtocol! { get set }
    var interactor: EventInteractorInput! { get set }
}

protocol EventEditViewProtocol: class {
    
}

class EventEditPresenter: EventEditPresenterProtocol {
    
    weak var view: EventEditViewProtocol!
    
    var interactor: EventInteractorInput!
}

extension EventEditPresenter: EventInteractorOutput {
    
}
