//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

class TemplateTranslator: MultiTranslator {
    
    typealias Input = DBTodo
    typealias Output = TodoModel
    
    func translate(_ inputs: [DBTodo]) -> [TodoModel] {
        return inputs.map { input -> TodoModel in
            return translate(input)
        }
    }
    
    func translate(_ input: DBTodo) -> TodoModel {
        let model = TodoModel()
        model.id = input.id
        
        // string
        model.name = input.name
        model.summery = input.summery
        // date
        model.limit = input.limit
        // enum
        model.priority = TodoPriority(rawValue: input.priority) ?? .normal
        model.status = RecordStatus(rawValue: input.status) ?? .draft
        // boolean
        model.completed = input.completed
        // integer
        model.notify = input.notify
        // array
        model.stickers = [] // TODO: StickerTranslator
        model.assets = [] // TODO: AssetsTranslator
        
        return model
    }
}
