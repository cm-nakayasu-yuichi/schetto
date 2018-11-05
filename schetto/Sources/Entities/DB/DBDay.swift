//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation
import RealmSwift

class DBDay: RealmSwift.Object, RealmIdentifiedObject {
    @objc dynamic var id = ""
    @objc dynamic var date: Date? = nil
    
    var stickers = RealmSwift.List<DBSticker>()
    var diaries = RealmSwift.List<DBDiary>()
    
    let linkingCalendar = LinkingObjects(fromType: DBCalendar.self, property: "days")
    
    override static func primaryKey() -> String? { return "id" }
}
