//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

protocol TodoEditPresenterProtocol: class {
    
    var view: TodoEditViewProtocol! { get set }
    var interactor: TodoInteractorInput! { get set }
}

protocol TodoEditViewProtocol: class {
    
}

class TodoEditPresenter: TodoEditPresenterProtocol {
    
    weak var view: TodoEditViewProtocol!
    
    var interactor: TodoInteractorInput!
}

extension TodoEditPresenter: TodoInteractorOutput {
    
    func updated(_ models: [TodoModel]) {
        
    }
}
