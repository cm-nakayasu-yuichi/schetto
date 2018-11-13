//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

protocol TodoListPresenterProtocol: class {
    
    var view: TodoListViewProtocol! { get set }
    var interactor: TodoInteractorInput! { get set }
    
    func fetchList(sortType: TodoSortType)
    func fetchStoredSortType()
}

protocol TodoListViewProtocol: class {
    
    func fetched(storedSortType: TodoSortType)
    
    func fetched(list: [TodoListModel])
}

class TodoListPresenter: TodoListPresenterProtocol {
    
    weak var view: TodoListViewProtocol!
    
    var interactor: TodoInteractorInput!
    
    func fetchList(sortType: TodoSortType) {
        interactor.fetchList(sortType: sortType)
    }
    
    func fetchStoredSortType() {
        let sortType = TodoSortType(rawValue: AppConfig().todoSortType)!
        view.fetched(storedSortType: sortType)
    }
}

extension TodoListPresenter: TodoInteractorOutput {
    
    func fetched(list: [TodoListModel]) {
        view.fetched(list: list)
    }
    
    func updated(_ models: [TodoModel]) {
        
    }
}
