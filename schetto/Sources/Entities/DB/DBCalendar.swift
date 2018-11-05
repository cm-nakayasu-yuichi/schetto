//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation
import RealmSwift

class DBCalendar: RealmSwift.Object, RealmIdentifiedObject {
    @objc dynamic var id = ""
    @objc dynamic var name = ""
    
    var days = RealmSwift.List<DBDay>()
    var events = RealmSwift.List<DBEvent>()
    var todos = RealmSwift.List<DBTodo>()
    
    override static func primaryKey() -> String? { return "id" }
}
