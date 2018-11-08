//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

class TodoTranslator: MultiTranslator {
    
    typealias Input = DBTodo
    typealias Output = TodoModel
    
    func translate(_ inputs: [DBTodo]) -> [TodoModel] {
        return inputs.map { input -> TodoModel in
            return translate(input)
        }
    }
    
    func translate(_ input: DBTodo) -> TodoModel {
        let model = TodoModel()
        
        return model
    }
}
