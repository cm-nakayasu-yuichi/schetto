//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

protocol TodoDetailCellDelegate: class {
    
    func didTapComplete(at cell: TodoDetailCell)
    
    func didTapEditTitle(at cell: TodoDetailCell)
    
    func didTapEditSummery(at cell: TodoDetailCell)
    
    func didChangePriority(at cell: TodoDetailCell, priority: TodoPriority)
    
    func didSelectKeyValue(at cell: TodoDetailCell, indexPath: IndexPath)
    
    func didTapAsset(at cell: TodoDetailCell, indexPath: IndexPath)
    
    func didTapAddAsset(at cell: TodoDetailCell)
    
    func didTapDelete(at cell: TodoDetailCell)
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
        delegate.didTapComplete(at: self)
    }
    
    @IBAction private func didTapEditButton() {
        delegate.didTapEditTitle(at: self)
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
        delegate.didTapEditSummery(at: self)
    }
}

class TodoDetailKeyValueCell: UITableViewCell, TodoDetailCell {
    
    weak var delegate: TodoDetailCellDelegate!
    var indexPath: IndexPath!
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var valueLabel: UILabel!
    @IBOutlet private weak var editButton: UIButton!
    
    var title = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    var value: String? = "" {
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
        delegate.didSelectKeyValue(at: self, indexPath: indexPath)
    }
}

class TodoDetailPriorityCell: UITableViewCell, TodoDetailCell {
    
    weak var delegate: TodoDetailCellDelegate!
    
    var priority: TodoPriority = .normal {
        didSet {
            
        }
    }
}

class TodoDetailAssetCell: UITableViewCell, TodoDetailCell {
    
    weak var delegate: TodoDetailCellDelegate!
    var indexPath: IndexPath!
    
    @IBOutlet private weak var assetImageView: UIImageView!
    
    var assetImage: UIImage? {
        didSet {
            assetImageView.image = assetImage
        }
    }
    
    @IBAction private func didTapAssetImageView() {
        delegate.didTapAsset(at: self, indexPath: indexPath)
    }
}

class TodoDetailAddAssetCell: UITableViewCell, TodoDetailCell {
    
    weak var delegate: TodoDetailCellDelegate!
    
    @IBOutlet private weak var addButton: UIButton!
    
    @IBAction private func didTapAddButton() {
        delegate.didTapAddAsset(at: self)
    }
}


class TodoDetailDeleteCell: UITableViewCell, TodoDetailCell {
    
    weak var delegate: TodoDetailCellDelegate!
    
    @IBOutlet private weak var deleteButton: UIButton!
    
    @IBAction private func didTapDeleteButton() {
        delegate.didTapDelete(at: self)
    }
}
