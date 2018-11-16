//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

protocol TodoInteractorInput: class {
    
    var output: TodoInteractorOutput! { get set }
    
    func fetchList(sortType: TodoSortType)
    func register(_ model: TodoModel)
    func remove(_ model: TodoModel)
    func registerNotify(before minutes: Int, to id: String)
}

protocol TodoInteractorOutput: class {
    
    func fetched(list: [TodoListModel])
    func registered(model: TodoModel)
}

class TodoRepository: TodoInteractorInput {
    
    weak var output: TodoInteractorOutput!
    
    func fetchList(sortType: TodoSortType) {
        
    }
    
    func register(_ model: TodoModel) {
        output.registered(model: model)
    }
    
    func remove(_ model: TodoModel) {
        
    }
    
    func registerNotify(before minutes: Int, to id: String) {
        
    }
}
