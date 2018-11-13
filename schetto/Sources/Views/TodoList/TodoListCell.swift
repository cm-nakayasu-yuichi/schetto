//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

protocol TodoListCellDelegate: class {
    
    func didTapComplete(at cell: TodoListCell, complete: Bool)
}

class TodoListCell: UITableViewCell {
    
    weak var delegate: TodoListCellDelegate!
    var indexPath: IndexPath!
    
    @IBOutlet private weak var completedCheckButton: UIButton!
    @IBOutlet private weak var limitLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var priorityView: UIView!
    
    var todo: TodoModel! {
        didSet {
            completedCheckButton.isSelected = todo.completed
            limitLabel.text = todo.limitText
            titleLabel.text = todo.title
            //priorityView
        }
    }
    
    @IBAction private func didTapCompletedCheckButton() {
        completedCheckButton.isSelected = !completedCheckButton.isSelected
        delegate.didTapComplete(at: self, complete: completedCheckButton.isSelected)
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
