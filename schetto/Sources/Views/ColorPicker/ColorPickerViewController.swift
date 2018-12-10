//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class ColorPickerViewController: UIViewController {
    
    typealias CommitHandler = (UIColor) -> ()

    var color: UIColor?
    var commitHandler: CommitHandler!
    
    private var adapter: ColorPickerAdapter!
    
    @IBOutlet private weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCloseButtonOnNavigationBar()
        adapter = ColorPickerAdapter(collectionView, delegate: self, colors: ColorSet.default.colors)
    }
}

extension ColorPickerViewController: ColorPickerAdapterDelegate {
    
    func colorPickerAdapter(_ adapter: ColorPickerAdapter, didSelectColor color: UIColor) {
        
    }
}
