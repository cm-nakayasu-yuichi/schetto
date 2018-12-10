//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

protocol ColorPickerCellDelegate: class {
    
    func colorPickerCell(_ cell: ColorPickerCell, didTapColorButtonAt index: Int)
}

class ColorPickerCell: UICollectionViewCell {
    
    weak var delegate: ColorPickerCellDelegate!
    
    @IBOutlet private weak var selectorView: UIView!
    @IBOutlet private weak var colorView: ColorView!
    
    var index: Int!
    
    var color: UIColor! {
        didSet {
            colorView.color = color
        }
    }
    
    override var isSelected: Bool {
        didSet {
            selectorView.backgroundColor = isSelected ? .enhance1 : .white
        }
    }
    
    @IBAction private func didTapColorButton() {
        delegate.colorPickerCell(self, didTapColorButtonAt: index)
    }
}
