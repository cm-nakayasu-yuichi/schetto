//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation
import RealmSwift

class DBDay: RealmSwift.Object, RealmIdentifiedObject {
    @objc dynamic var id = ""
    
    override static func primaryKey() -> String? { return "id" }
}
