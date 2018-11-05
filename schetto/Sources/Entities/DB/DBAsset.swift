//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation
import RealmSwift

class DBAsset: RealmSwift.Object, RealmIdentifiedObject {
    @objc dynamic var id = ""
    @objc dynamic var type = 0
    
    let linkingEvent = LinkingObjects(fromType: DBEvent.self, property: "assets")
    let linkingTodo = LinkingObjects(fromType: DBTodo.self, property: "assets")
    let linkingDiary = LinkingObjects(fromType: DBDiary.self, property: "assets")
    
    override static func primaryKey() -> String? { return "id" }
}
