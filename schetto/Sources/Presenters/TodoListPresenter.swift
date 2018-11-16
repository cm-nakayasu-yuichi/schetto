//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

protocol TodoListPresenterProtocol: class {
    
    var view: TodoListViewProtocol! { get set }
    var interactor: TodoInteractorInput! { get set }
    
    func fetchTodoList(sortType: TodoSortType)
    func fetchStoredSortType()
    func update(completed: Bool, todo: TodoModel)
}

protocol TodoListViewProtocol: class {
    
    func fetched(storedSortType: TodoSortType)
    func show(todoListModels: [TodoListModel])
    func showEmpty()
}

class TodoListPresenter: TodoListPresenterProtocol {
    
    weak var view: TodoListViewProtocol!
    
    var interactor: TodoInteractorInput!
    
    func fetchTodoList(sortType: TodoSortType) {
        interactor.fetchTodoList(sortType: sortType)
    }
    
    func fetchStoredSortType() {
        let sortType = TodoSortType(rawValue: AppConfig().todoSortType)!
        view.fetched(storedSortType: sortType)
    }
    
    func update(completed: Bool, todo: TodoModel) {
        todo.completed = completed
        interactor.register(todo)
    }
}

extension TodoListPresenter: TodoInteractorOutput {
    
    func fetched(list: [TodoListModel]) {
        if list.isEmpty {
            view.showEmpty()
        } else {
            view.show(todoListModels: list)
        }
    }
    
    func registered(todo: TodoModel) {
        // NOP.
    }
    
    // unuse.
    func created(todo: TodoModel) {
    }
    
    // unuse.
    func removed() {
    }
    
    // unuse.
    func copied(todo: TodoModel) {
    }
}
