//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

protocol TodoListCellDelegate: class {
    
}

class TodoListCell: UITableViewCell {
    
    weak var delegate: TodoListCellDelegate!
    var indexPath: IndexPath!
    
    var item: Any! {
        didSet {
            // NOP.
        }
    }
}

class TodoListTitleCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    var title = "" {
        didSet {
            titleLabel.text = title
        }
    }
}
