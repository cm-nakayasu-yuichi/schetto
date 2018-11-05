//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

protocol EventEditCellDelegate: class {
    
}

class EventEditCell: UITableViewCell {
    
    weak var delegate: EventEditCellDelegate!
    var indexPath: IndexPath!
    
    var item: Any! {
        didSet {
            // NOP.
        }
    }
}
