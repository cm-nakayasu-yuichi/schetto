//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

protocol TodoDetailPresenterProtocol: class {
    
    var view: TodoDetailViewProtocol! { get set }
    var interactor: TodoInteractorInput! { get set }
}

protocol TodoDetailViewProtocol: class {
    
}

class TodoDetailPresenter: TodoDetailPresenterProtocol {
    
    weak var view: TodoDetailViewProtocol!
    
    var interactor: TodoInteractorInput!
}

extension TodoDetailPresenter: TodoInteractorOutput {
    
    func fetched(list: [TodoListModel]) {
        
    }
    
    func updated(_ models: [TodoModel]) {
        
    }
}
