//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

protocol ColorPickerCellDelegate: class {
    
}

class ColorPickerCell: UICollectionViewCell {
    
    weak var delegate: ColorPickerCellDelegate!
    var indexPath: IndexPath!
    
    var item: Any! {
        didSet {
            // NOP.
        }
    }
}
