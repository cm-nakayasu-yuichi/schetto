//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

protocol ColorPickerCellDelegate: class {
    
    func colorPickerCell(_ cell: ColorPickerCell, didSelectColor color: UIColor)
}

class ColorPickerCell: UICollectionViewCell {
    
    weak var delegate: ColorPickerCellDelegate!
    
    @IBOutlet private weak var outerView: UIView!
    @IBOutlet private weak var innerView: UIView!
    
    var color: UIColor! {
        didSet {
            innerView.backgroundColor = color
        }
    }
    
    @IBAction private func didTapColorButton() {
        delegate.colorPickerCell(self, didSelectColor: color)
    }
}
