//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation
import RealmSwift

class DBEvent: RealmSwift.Object, RealmIdentifiedObject {
    @objc dynamic var id = ""
    @objc dynamic var name = ""
    @objc dynamic var start: Date? = nil
    @objc dynamic var end: Date? = nil
    @objc dynamic var all = false // 終日フラグ
    @objc dynamic var summery = ""
    @objc dynamic var place = ""
    @objc dynamic var notify = 0 // notify分前に通知する
    @objc dynamic var color = "" // rgb
    @objc dynamic var status = RecordStatus.draft.rawValue
    
    var stickers = RealmSwift.List<DBSticker>()
    var assets = RealmSwift.List<DBAsset>()
    
    let linkingCalendar = LinkingObjects(fromType: DBCalendar.self, property: "events")
    
    override static func primaryKey() -> String? { return "id" }
}
