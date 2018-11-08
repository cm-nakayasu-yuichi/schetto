//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

protocol TodoDetailCellDelegate: class {
    
}

class TodoDetailTitleCell: UITableViewCell {
    
    weak var delegate: TodoDetailCellDelegate!
    
    @IBOutlet private weak var completeCheck: UIButton!
    @IBOutlet private weak var titleLabel: UILabel!
    
    var check = false {
        didSet {
            completeCheck.isSelected = check
        }
    }
    
    var title = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    @IBAction private func didTapCheckButton() {
        
    }
}

class TodoDetailSummeryCell: UITableViewCell {
    
    @IBOutlet private weak var summeryLabel: UILabel!
    
    var summery = "" {
        didSet {
            summeryLabel.text = summery
        }
    }
}

class TodoDetailKeyValueCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var valueLabel: UILabel!
    
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
}

class TodoDetailPriorityCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    var title = "" {
        didSet {
            titleLabel.text = title
        }
    }
}

class TodoDetailAssetCell: UITableViewCell {
    
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

class TodoDetailDeleteCell: UITableViewCell {
    
    weak var delegate: TodoDetailCellDelegate!
    
    @IBOutlet private weak var deleteButton: UIButton!
    
    @IBAction private func didTapDeleteButton() {
        
    }
}
