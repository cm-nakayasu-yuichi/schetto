//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

protocol ColorPickerAdapterDelegate: class {
    
    func numberOfItems(in adapter: ColorPickerAdapter) -> Int
    
    func colorPickerAdapter(_ adapter: ColorPickerAdapter, itemAt index: Int) -> Any
    
    func colorPickerAdapter(_ adapter: ColorPickerAdapter, didSelectAt index: Int)
}

class ColorPickerAdapter: NSObject, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    weak var collectionView: UICollectionView!
    weak var delegate: ColorPickerAdapterDelegate!
    
    convenience init(_ collectionView: UICollectionView, delegate: ColorPickerAdapterDelegate) {
        self.init()
        self.collectionView = collectionView
        self.delegate = delegate
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegate.numberOfItems(in: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ColorPickerCell
        cell.indexPath = indexPath
        cell.delegate = self
        cell.item = delegate.colorPickerAdapter(self, itemAt: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        delegate.colorPickerAdapter(self, didSelectAt: indexPath.row)
    }
}

extension ColorPickerAdapter: ColorPickerCellDelegate {
    
}
