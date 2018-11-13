//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

protocol EmptyViewControllable {
    
    var emptyView: UIView { get }
}

extension EmptyViewControllable {
    
    func setupEmptyView() {
        emptyView.isHidden = true
    }
}
