//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation
import RealmSwift

class DBTemplate: RealmSwift.Object, RealmIdentifiedObject {
    @objc dynamic var id = ""
    @objc dynamic var text = ""
    @objc dynamic var type = 0
    
    override static func primaryKey() -> String? { return "id" }
}
