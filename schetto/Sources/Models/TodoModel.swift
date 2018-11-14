//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class TodoListModel {
    var title = ""
    var todos = [TodoModel]()
}

class TodoModel {
    var id = ""
    var title = ""
    var limit: Date? = nil
    var priority = TodoPriority.normal
    var summery = ""
    var completed = false
    var notify = 0 // notify分前に通知する
    var status = RecordStatus.draft
    
    var stickers = [StickerModel]()
    var assets = [AssetModel]()
}

extension TodoModel {
    
    private static let noLimitText = "期限なし"
    
    var limitText: String {
        guard let date = limit else {
            return TodoModel.noLimitText
        }
        return date.todoLimitString
    }
    
    static func limitText(model modelOrNil: TodoModel?) -> String {
        guard let model = modelOrNil else {
            return TodoModel.noLimitText
        }
        return model.limitText
    }
}
