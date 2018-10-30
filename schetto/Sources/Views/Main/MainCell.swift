//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

protocol MainCellDelegate: class {
    
}

class MainCell: UICollectionViewCell {
    
    weak var delegate: MainCellDelegate!
    var indexPath: IndexPath!
    
    var item: Any! {
        didSet {
            // NOP.
        }
    }
}
