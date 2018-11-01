//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

protocol DrawerMenuCellDelegate: class {
    
}

class DrawerMenuCell: UITableViewCell {
    
    weak var delegate: DrawerMenuCellDelegate!
    
    @IBOutlet private weak var itemTitleLabel: UILabel!
    @IBOutlet private weak var iconImageView: UIImageView!
    
    var item: DrawerMenuItem? {
        didSet {
            title = item?.title ?? ""
            //icon = nil // TODO: アイコン画像
        }
    }
    
    var title = "" {
        didSet {
            itemTitleLabel.text = title
        }
    }
    
    var icon: UIImage? {
        didSet {
            iconImageView.image = icon
        }
    }
}

class DrawerMenuSectionCell: UITableViewCell {
    
    @IBOutlet private weak var sectionTitleLabel: UILabel!
    
    var title = "" {
        didSet {
            sectionTitleLabel.text = title
        }
    }
}
