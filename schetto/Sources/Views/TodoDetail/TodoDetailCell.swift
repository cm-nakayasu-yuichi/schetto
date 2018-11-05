//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

protocol TodoDetailCellDelegate: class {
    
}

class TodoDetailCell: UITableViewCell {
    
    weak var delegate: TodoDetailCellDelegate!
    var indexPath: IndexPath!
    
    var item: Any! {
        didSet {
            // NOP.
        }
    }
}
