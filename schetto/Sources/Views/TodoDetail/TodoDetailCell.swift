//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

protocol TodoDetailCellDelegate: class {
    
}

protocol TodoDetailCell: class {
    
    var delegate: TodoDetailCellDelegate! { get set }
}

class TodoDetailTitleCell: UITableViewCell, TodoDetailCell {
    
    weak var delegate: TodoDetailCellDelegate!
    
    @IBOutlet private weak var completeCheck: UIButton!
    @IBOutlet private weak var titleLabel: UILabel!
    
    var check = false {
        didSet {
            //completeCheck.isSelected = check
        }
    }
    
    var title = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    @IBAction private func didTapCheckButton() {
        
    }
    
    @IBAction private func didTapEditButton() {
        
    }
}

class TodoDetailSummeryCell: UITableViewCell, TodoDetailCell {
    
    weak var delegate: TodoDetailCellDelegate!
    
    @IBOutlet private weak var summeryLabel: UILabel!
    
    var summery = "" {
        didSet {
            summeryLabel.text = summery
        }
    }
    
    @IBAction private func didTapEditButton() {
        
    }
}

class TodoDetailKeyValueCell: UITableViewCell, TodoDetailCell {
    
    weak var delegate: TodoDetailCellDelegate!
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var valueLabel: UILabel!
    @IBOutlet private weak var editButton: UIButton!
    
    var title = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    var value = "" {
        didSet {
            valueLabel.text = value
        }
    }
    
    var valueColor: UIColor? {
        didSet {
            valueLabel.textColor = valueColor
        }
    }
    
    var editable = true {
        didSet {
            editButton.isHidden = !editable
        }
    }
    
    @IBAction private func didTapEditButton() {
        
    }
}

class TodoDetailPriorityCell: UITableViewCell, TodoDetailCell {
    
    weak var delegate: TodoDetailCellDelegate!
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    var priority: TodoPriority = .normal {
        didSet {
            
        }
    }
}

class TodoDetailAssetCell: UITableViewCell, TodoDetailCell {
    
    weak var delegate: TodoDetailCellDelegate!
    
    @IBOutlet private weak var assetImageView: UIImageView!
    
    var assetImage: UIImage? {
        didSet {
            assetImageView.image = assetImage
        }
    }
    
    @IBAction private func didTapCheckButton() {
        
    }
}

class TodoDetailDeleteCell: UITableViewCell, TodoDetailCell {
    
    weak var delegate: TodoDetailCellDelegate!
    
    @IBOutlet private weak var deleteButton: UIButton!
    
    @IBAction private func didTapDeleteButton() {
        
    }
}
