//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class EventModel {
    var id = ""
    var name = ""
    var start: Date? = nil
    var end: Date? = nil
    var all = false
    var summery = ""
    var notify = 0 // notify分前に通知する
    var color: UIColor?
    var status = RecordStatus.draft
    
    var stickers = [StickerModel]()
    var assets = [AssetModel]()
    var places = [String]()
}
