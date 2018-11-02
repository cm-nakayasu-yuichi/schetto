//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation
import RealmSwift

class DBEvent: RealmSwift.Object, RealmIdentifiedObject {
    @objc dynamic var id = ""
    @objc dynamic var name = ""
    @objc dynamic var start = ""
    @objc dynamic var end = ""
    @objc dynamic var all = false // 終日フラグ
    @objc dynamic var place = ""
    @objc dynamic var notify = 0 // notify分前に通知する
    @objc dynamic var color: DBColor?
    @objc dynamic var sticker: DBSticker?
    
    let linkingCalendar = LinkingObjects(fromType: DBCalendar.self, property: "events")
    
    override static func primaryKey() -> String? { return "id" }
}
