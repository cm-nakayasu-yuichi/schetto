//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

protocol TodoInteractorInput: class {
    
    var output: TodoInteractorOutput! { get set }
    
    func create()
    func copy(_ model: TodoModel)
    func fetchList(sortType: TodoSortType)
    func register(_ model: TodoModel)
    func registerNotify(before minutes: Int, to id: String)
    func remove(_ model: TodoModel)
}

protocol TodoInteractorOutput: class {
    
    func created(model: TodoModel)
    func copied(model: TodoModel)
    func fetched(list: [TodoListModel])
    func registered(model: TodoModel)
    func removed()
}

class TodoRepository: TodoInteractorInput {
    
    weak var output: TodoInteractorOutput!
    
    func create() {
        
    }
    
    func copy(_ model: TodoModel) {
        
    }
    
    func fetchList(sortType: TodoSortType) {
        
    }
    
    func register(_ model: TodoModel) {
        output.registered(model: model)
    }
    
    func registerNotify(before minutes: Int, to id: String) {
        
    }
    
    func remove(_ model: TodoModel) {
        
    }
}
