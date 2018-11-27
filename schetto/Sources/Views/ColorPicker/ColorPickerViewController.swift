//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class ColorPickerViewController: UIViewController {

    var presenter: ColorPickerPresenterProtocol!
    
    private var adapter: ColorPickerAdapter!
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var closeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        adapter = ColorPickerAdapter(collectionView, delegate: self)
    }
    
    @IBAction private func didTapCloseButton() {
        // NOP.
    }
}

extension ColorPickerViewController: ColorPickerViewProtocol {

}

extension ColorPickerViewController: ColorPickerAdapterDelegate {
    
    func numberOfItems(in adapter: ColorPickerAdapter) -> Int {
        return 20
//        return presenter.items.count
    }
    
    func colorPickerAdapter(_ adapter: ColorPickerAdapter, itemAt index: Int) -> Any {
        return "hoge"
//        return presenter.items[index]
    }
    
    func colorPickerAdapter(_ adapter: ColorPickerAdapter, didSelectAt index: Int) {
        // NOP.
    }
}