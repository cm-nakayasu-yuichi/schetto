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
    
    @IBOutlet private weak var captionLabel: UILabel!
    @IBOutlet private weak var valueLabel: UILabel!
    
    var indexPath: IndexPath!
    
    var caption = "" {
        didSet {
            captionLabel.text = caption
        }
    }
    
    var value = "" {
        didSet {
            valueLabel.text = value
        }
    }
    
    @IBAction private func didTapEditButton() {
        delegate.didTapEditText(in: self, at: indexPath)
    }
}

// MARK: - Date Cell Class. -

protocol EventDateCellDelegate: class {
    
    func didTapStartDate(in cell: EventDateCell)
    func didTapEndDate(in cell: EventDateCell)
}

class EventDateCell: UITableViewCell {
    
    weak var delegate: EventDateCellDelegate!
    
    @IBOutlet private weak var startDayLabel: UILabel!
    @IBOutlet private weak var startTimeLabel: UILabel!
    @IBOutlet private weak var endDayLabel: UILabel!
    @IBOutlet private weak var endTimeLabel: UILabel!
    
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
    
    @IBAction private func didTapStartButton() {
        delegate.didTapStartDate(in: self)
    }
    
    @IBAction private func didTapEndButton() {
        delegate.didTapEndDate(in: self)
    }
}

// MARK: - Information Cell Class. -

protocol EventInfoCellDelegate: class {
    
    func didTapColorButton(in cell: EventInfoCell)
    func didTapStickerButton(in cell: EventInfoCell)
    func didChangeAllDay(in cell: EventInfoCell, to value: Bool)
}

class EventInfoCell: UITableViewCell {
    
    weak var delegate: EventInfoCellDelegate!
    
    @IBOutlet private weak var colorView: ColorView!
    @IBOutlet private weak var stickerView: UIImageView!
    @IBOutlet private weak var allDaySwitch: UISwitch!
    
    var indexPath: IndexPath!
    
    var color: UIColor? {
        didSet {
            colorView.color = color ?? .clear
        }
    }
    
    var stickerImage: UIImage? {
        didSet {
            stickerView.image = stickerImage
        }
    }
    
    var allDay = false {
        didSet {
            allDaySwitch.isOn = allDay
        }
    }
    
    @IBAction private func didTapColorButton() {
        delegate.didTapColorButton(in: self)
    }
    
    @IBAction private func didTapStickerButton() {
        delegate.didTapStickerButton(in: self)
    }
    
    @IBAction private func didChangeAllDaySwitch() {
        delegate.didChangeAllDay(in: self, to: allDaySwitch.isOn)
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
        delegate.didTapAsset(in: self, asset: asset)
    }
    
    @IBAction private func didTapDeleteButton() {
        delegate.didTapDeleteAsset(in: self, asset: asset)
    }
}

// MARK: - AddAsset Cell Class. -

protocol EventAddAssetCellDelegate: class {
    
    func didTapAddAsset(in cell: EventAddAssetCell)
}

class EventAddAssetCell: UITableViewCell {
    
    weak var delegate: EventAddAssetCellDelegate!
    
    @IBAction private func didTapAddAssetButton() {
        delegate.didTapAddAsset(in: self)
    }
}
