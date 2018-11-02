//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation
import RealmSwift

class DBCalendar: RealmSwift.Object, RealmIdentifiedObject {
    @objc dynamic var id = ""
    @objc dynamic var name = ""
    
    var events = RealmSwift.List<DBEvent>()
    
    override static func primaryKey() -> String? { return "id" }
}
