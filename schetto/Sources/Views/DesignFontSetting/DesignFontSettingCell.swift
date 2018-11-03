//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

protocol DesignFontSettingCellDelegate: class {
    
}

class DesignFontSettingCell: UITableViewCell {
    
    weak var delegate: DesignFontSettingCellDelegate!
    var indexPath: IndexPath!
    
    var item: Any! {
        didSet {
            // NOP.
        }
    }
}
