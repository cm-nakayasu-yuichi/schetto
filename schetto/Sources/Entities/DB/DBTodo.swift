//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation
import RealmSwift

class DBTodo: RealmSwift.Object, RealmIdentifiedObject {
    @objc dynamic var id = ""
    @objc dynamic var name = ""
    @objc dynamic var limit: Date? = nil
    @objc dynamic var primary = 0
    @objc dynamic var summery = ""
    @objc dynamic var completed = false
    @objc dynamic var notify = 0 // notify分前に通知する
    @objc dynamic var status = RecordStatus.draft.rawValue
    
    var stickers = RealmSwift.List<DBSticker>()
    var assets = RealmSwift.List<DBAsset>()
    
    let linkingCalendar = LinkingObjects(fromType: DBCalendar.self, property: "todos")
    
    override static func primaryKey() -> String? { return "id" }
}
