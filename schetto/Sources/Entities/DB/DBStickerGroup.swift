//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation
import RealmSwift

class DBStickerGroup: RealmSwift.Object, RealmIdentifiedObject {
    @objc dynamic var id = ""
    @objc dynamic var name = ""
    @objc dynamic var author = ""
    @objc dynamic var price = 0
    @objc dynamic var type = 0
    
    var stickers = RealmSwift.List<DBSticker>()
    
    override static func primaryKey() -> String? { return "id" }
}
