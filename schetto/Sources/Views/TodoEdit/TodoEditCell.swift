//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

protocol TodoEditCellDelegate: class {
    
}

class TodoEditCell: UITableViewCell {
    
    weak var delegate: TodoEditCellDelegate!
    var indexPath: IndexPath!
    
    var item: Any! {
        didSet {
            // NOP.
        }
    }
}
