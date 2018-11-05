//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

protocol TodoInteractorInput: class {
    
    var output: TodoInteractorOutput! { get set }
    
    func register(_ model: TodoModel)
    func remove(_ model: TodoModel)
    func updateComplete(_ complete: Bool, to id: String)
    func registerNotify(before minutes: Int, to id: String)
}

protocol TodoInteractorOutput: class {
    
    func updated(_ models: [TodoModel])
}

class TodoRepository: TodoInteractorInput {
    
    weak var output: TodoInteractorOutput!
    
    func register(_ model: TodoModel) {
        
    }
    
    func remove(_ model: TodoModel) {
        
    }
    
    func updateComplete(_ complete: Bool, to id: String) {
        
    }
    
    func registerNotify(before minutes: Int, to id: String) {
        
    }
}
