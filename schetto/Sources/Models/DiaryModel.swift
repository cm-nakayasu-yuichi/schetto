//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class DiaryModel {
    var id = ""
    var title: String?
    var status = RecordStatus.draft
    var sort = 0
    
    var assets = [AssetModel]()
}
