//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

protocol TodoListPresenterProtocol: class {
    
    var view: TodoListViewProtocol! { get set }
    var interactor: TodoInteractorInput! { get set }
    func fetchStoredSortType()
}

protocol TodoListViewProtocol: class {
    
    func fetched(storedSortType: TodoSortType)
}

class TodoListPresenter: TodoListPresenterProtocol {
    
    weak var view: TodoListViewProtocol!
    
    var interactor: TodoInteractorInput!
    
    func fetchStoredSortType() {
        let sortType = TodoSortType(rawValue: AppConfig().todoSortType)!
        view.fetched(storedSortType: sortType)
    }
}

extension TodoListPresenter: TodoInteractorOutput {
    
    func fetched(list: [TodoListModel]) {
        
    }
    
    func updated(_ models: [TodoModel]) {
        
    }
}
