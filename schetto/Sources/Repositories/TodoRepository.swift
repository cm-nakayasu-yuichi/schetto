//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

protocol TodoInteractorInput: class {
    
    var output: TodoInteractorOutput! { get set }
    
    func createTodo()
    func copy(_ todo: TodoModel)
    func fetchTodoList(sortType: TodoSortType)
    func register(_ todo: TodoModel)
    func registerNotify(before minutes: Int, to id: String)
    func remove(_ todo: TodoModel)
}

protocol TodoInteractorOutput: class {
    
    func created(todo: TodoModel)
    func copied(todo: TodoModel)
    func fetched(list: [TodoListModel])
    func registered(todo: TodoModel)
    func removed()
}

class TodoRepository: TodoInteractorInput {
    
    weak var output: TodoInteractorOutput!
    
    func createTodo() {
        let todo = TodoModel()
        output.created(todo: todo)
    }
    
    func copy(_ todo: TodoModel) {
        let translator = TodoTranslator()
        let dbEntity = translator.detranslate(todo)
        let copied = translator.translate(dbEntity)
        output.copied(todo: copied)
    }
    
    func fetchTodoList(sortType: TodoSortType) {
        
    }
    
    func register(_ todo: TodoModel) {
        output.registered(todo: todo)
    }
    
    func registerNotify(before minutes: Int, to id: String) {
        
    }
    
    func remove(_ todo: TodoModel) {
        
    }
}
