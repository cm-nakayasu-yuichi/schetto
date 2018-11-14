//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

protocol TodoListCellDelegate: class {
    
    func didTapComplete(of cell: TodoListCell, completed: Bool)
}

class TodoListCell: UITableViewCell {
    
    weak var delegate: TodoListCellDelegate!
    
    @IBOutlet private weak var completedCheckButton: UIButton!
    @IBOutlet private weak var limitLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var priorityView: UIView!
    @IBOutlet private weak var separatorLine: UIView!
    
    var todo: TodoModel! {
        didSet {
            completedCheckButton.isSelected = todo.completed
            limitLabel.text = todo.limitText
            titleLabel.text = todo.title
            //priorityView
        }
    }
    
    var isLastRow = false {
        didSet {
            separatorLine.isHidden = isLastRow
        }
    }
    
    @IBAction private func didTapCompletedCheckButton() {
        completedCheckButton.isSelected = !completedCheckButton.isSelected
        delegate.didTapComplete(of: self, completed: completedCheckButton.isSelected)
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
