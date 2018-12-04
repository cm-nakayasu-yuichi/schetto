//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

// MARK: - Title Cell Class. -

protocol EventTextCellDelegate: class {
    
    func didTapEditText(in cell: EventTextCell, at indexPath: IndexPath)
}

class EventTextCell: UITableViewCell {
    
    weak var delegate: EventTextCellDelegate!
    
    @IBOutlet private weak var valueLabel: UILabel!
    
    var indexPath: IndexPath!
    
    var value = "" {
        didSet {
            valueLabel.text = value
        }
    }
    
    @IBAction private func didTapEditButton() {
        
    }
}

// MARK: - Date Cell Class. -

protocol EventDateCellDelegate: class {
    
    func didTapStartDate(in cell: EventDateCell)
    func didTapEndDate(in cell: EventDateCell)
    func didChangeAllDay(in cell: EventDateCell, to value: Bool)
}

class EventDateCell: UITableViewCell {
    
    weak var delegate: EventDateCellDelegate!
    
    @IBOutlet private weak var startDayLabel: UILabel!
    @IBOutlet private weak var startTimeLabel: UILabel!
    @IBOutlet private weak var endDayLabel: UILabel!
    @IBOutlet private weak var endTimeLabel: UILabel!
    @IBOutlet private weak var allDaySwitch: UISwitch!
    
    var indexPath: IndexPath!
    
    var startDateText: String! {
        didSet {
            startDayLabel.text = startDateText
        }
    }
    
    var startTimeText: String! {
        didSet {
            startTimeLabel.text = startTimeText
        }
    }
    
    var endDateText: String! {
        didSet {
            endDayLabel.text = endDateText
        }
    }
    
    var endTimeText: String! {
        didSet {
            endTimeLabel.text = endTimeText
        }
    }
    
    var allDay = false {
        didSet {
            allDaySwitch.isOn = allDay
        }
    }
    
    @IBAction private func didTapStartButton() {
        
    }
    
    @IBAction private func didTapEndButton() {
        
    }
    
    @IBAction private func didChangeAllDaySwitch() {
        
    }
}

// MARK: - Information Cell Class. -

protocol EventInfoCellDelegate: class {
    
    func didTapEditText(in cell: EventInfoCell, at indexPath: IndexPath)
}

class EventInfoCell: UITableViewCell {
    
    weak var delegate: EventInfoCellDelegate!
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    var indexPath: IndexPath!
    
    var title = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    @IBAction private func didTapEditButton() {
        
    }
}

// MARK: - Asset Cell Class. -

protocol EventAssetCellDelegate: class {
    
    func didTapAsset(in cell: EventAssetCell, asset: AssetModel)
    func didTapDeleteAsset(in cell: EventAssetCell, asset: AssetModel)
}

class EventAssetCell: UITableViewCell {
    
    weak var delegate: EventAssetCellDelegate!
    
    @IBOutlet private weak var assetImageView: UIImageView!
    
    var asset: AssetModel! {
        didSet {
//            assetImageView.image = asset.image
        }
    }
    
    @IBAction private func didTapAssetButton() {
        
    }
    
    @IBAction private func didTapDeleteButton() {
        
    }
}

// MARK: - AddAsset Cell Class. -

protocol EventAddAssetCellDelegate: class {
    
    func didTapAddAsset(in cell: EventAddAssetCell)
}

class EventAddAssetCell: UITableViewCell {
    
    weak var delegate: EventAddAssetCellDelegate!
    
    @IBAction private func didTapAddAssetButton() {
        
    }
}
