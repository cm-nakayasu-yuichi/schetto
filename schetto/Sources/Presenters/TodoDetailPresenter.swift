//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

protocol TodoDetailPresenterProtocol: class {
    
    var view: TodoDetailViewProtocol! { get set }
    var interactor: TodoInteractorInput! { get set }
    
    func fetchEditableTodo(from soruceTodo: TodoModel?)
    func register(_ todo: TodoModel)
    func remove(_ todo: TodoModel)
}

protocol TodoDetailViewProtocol: class {
    
    func fetchedEditable(todo: TodoModel)
    func registered()
    func removed()
}

class TodoDetailPresenter: TodoDetailPresenterProtocol {
    
    weak var view: TodoDetailViewProtocol!
    
    var interactor: TodoInteractorInput!
    
    func fetchEditableTodo(from soruceTodo: TodoModel?) {
        if let todo = soruceTodo {
            interactor.copy(todo)
        } else {
            interactor.createTodo()
        }
    }
    
    func register(_ todo: TodoModel) {
        
    }
    
    func remove(_ todo: TodoModel) {
        
    }
}

extension TodoDetailPresenter: TodoInteractorOutput {
    
    func created(todo: TodoModel) {
        view.fetchedEditable(todo: todo)
    }
    
    func copied(todo: TodoModel) {
        view.fetchedEditable(todo: todo)
    }
    
    func registered(todo: TodoModel) {
        
    }
    
    func removed() {
        
    }
    
    // unuse.
    func fetched(list: [TodoListModel]) {
    }
}
