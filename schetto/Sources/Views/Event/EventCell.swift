//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

protocol EventCellDelegate: class {
    
    
//    case summery
//    case notify
//    case repeating
//    case asset(model: AssetModel)
//    case addAsset
//    case delete
}

class EventCell: UITableViewCell {
    
    weak var delegate: EventCellDelegate!
    
    var event: EventModel!
}

class EventTitleCell: EventCell {
    
    override var event: EventModel! {
        didSet {
            
        }
    }
}

class EventDateCell: EventCell {
    
    override var event: EventModel! {
        didSet {
            
        }
    }
}

class EventInfoCell: EventCell {
    
    override var event: EventModel! {
        didSet {
            
        }
    }
}

class EventSummeryCell: EventCell {
    
    override var event: EventModel! {
        didSet {
            
        }
    }
}

class EventLocationCell: EventCell {
    
    override var event: EventModel! {
        didSet {
            
        }
    }
}

class EventAssetCell: EventCell {
    
    override var event: EventModel! {
        didSet {
            
        }
    }
}

class EventAddAssetCell: EventCell {
    
    override var event: EventModel! {
        didSet {
            
        }
    }
}
