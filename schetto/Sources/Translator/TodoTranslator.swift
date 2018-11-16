//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

class TodoTranslator: MultiTranslator, MultiDetranslator {

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
        model.title = input.title
        model.limit = input.limit
        model.priority = TodoPriority(rawValue: input.priority)!
        model.summery = input.summery
        model.completed = input.completed
        model.notify = input.notify
        model.status = RecordStatus(rawValue: input.status)!
//        model.stickers = input.stickers
//        model.assets = input.assets
        return model
    }
    
    func detranslate(_ outputs: [TodoModel]) -> [DBTodo] {
        return outputs.map { output -> DBTodo in
            return detranslate(output)
        }
    }
    
    func detranslate(_ output: TodoModel) -> DBTodo {
        let db = DBTodo()
        db.id = output.id
        db.title = output.title
        db.limit = output.limit
        db.priority = output.priority.rawValue
        db.summery = output.summery
        db.completed = output.completed
        db.notify = output.notify
        db.status = output.status.rawValue
//        db.stickers = output.stickers
//        db.assets = output.assets
        return db
    }
}
