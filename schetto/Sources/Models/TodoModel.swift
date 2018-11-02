//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class TodoModel {
    var id = ""
    var name = ""
    var limit: Date? = nil
    var primary = 0
    var summery = ""
    var completed = false
    var notify = 0 // notify分前に通知する
    var status = RecordStatus.draft
    
    var stickers = [StickerModel]()
    var assets = [AssetModel]()
}
