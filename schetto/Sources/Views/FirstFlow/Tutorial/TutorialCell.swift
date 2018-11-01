//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

protocol TutorialCellDelegate: class {
    
}

class TutorialCell: UICollectionViewCell {
    
    weak var delegate: TutorialCellDelegate!
    var indexPath: IndexPath!
    
    @IBOutlet private weak var tutorialImage: UIImageView!
    @IBOutlet private weak var captionLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    var item: Any! {
        didSet {
            // NOP.
        }
    }
}
