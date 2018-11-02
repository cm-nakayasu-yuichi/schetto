//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation
import RealmSwift

class DBDiary: RealmSwift.Object, RealmIdentifiedObject {
    @objc dynamic var id = ""
    @objc dynamic var title: String? = nil
    @objc dynamic var status = RecordStatus.draft.rawValue
    @objc dynamic var sort = 0
    
    var assets = RealmSwift.List<DBAsset>()
    
    let linkingDay = LinkingObjects(fromType: DBDay.self, property: "diaries")
    
    override static func primaryKey() -> String? { return "id" }
}
