//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

protocol DrawerMenuCellDelegate: class {
    
}

class DrawerMenuCell: UITableViewCell {
    
    weak var delegate: DrawerMenuCellDelegate!
    var indexPath: IndexPath!
    
    var item: Any! {
        didSet {
            // NOP.
        }
    }
}
