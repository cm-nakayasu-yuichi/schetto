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
    
    @IBOutlet private weak var completeCheck: UIButton!
    @IBOutlet private weak var limitLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var priorityView: UIView!
    
    var todo: TodoModel! {
        didSet {
            completeCheck.isSelected = todo.completed
            //limitLabel.text = todo.limit
            titleLabel.text = todo.title
            //priorityView
        }
    }
    
    @IBAction private func didTapCompleteCheckButton() {
        
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
