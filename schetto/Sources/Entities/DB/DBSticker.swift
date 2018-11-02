//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation
import RealmSwift

class DBSticker: RealmSwift.Object, RealmIdentifiedObject {
    @objc dynamic var id = ""
    
    let linkingStickerGroup = LinkingObjects(fromType: DBStickerGroup.self, property: "stickers")
    
    override static func primaryKey() -> String? { return "id" }
}
