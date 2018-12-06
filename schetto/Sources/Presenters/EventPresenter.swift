//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

protocol EventPresenterProtocol: class {
    
    var view: EventViewProtocol! { get set }
    var interactor: EventInteractorInput! { get set }
    
    func fetchEditableEvent(from soruceEvent: EventModel?)
    func register(_ event: EventModel)
    func remove(_ event: EventModel)
}

protocol EventViewProtocol: class {
    
    func fetchedEditable(event: EventModel)
    func registered()
    func removed()
}

class EventPresenter: EventPresenterProtocol {
    
    weak var view: EventViewProtocol!
    
    var interactor: EventInteractorInput!
    
    func fetchEditableEvent(from soruceEvent: EventModel?) {
        if let event = soruceEvent {
            interactor.copy(event)
        } else {
            interactor.create()
        }
    }
    
    func register(_ event: EventModel) {
        
    }
    
    func remove(_ event: EventModel) {
        
    }
}

extension EventPresenter: EventInteractorOutput {
    
    func created(model: EventModel) {
        view.fetchedEditable(event: model)
    }
    
    func copied(model: EventModel) {
        view.fetchedEditable(event: model)
    }
    
    func fetched(list: [EventModel]) {
        // NOP.
    }
    
    func registered(model: EventModel) {
        
    }
    
    func removed() {
        
    }
}
