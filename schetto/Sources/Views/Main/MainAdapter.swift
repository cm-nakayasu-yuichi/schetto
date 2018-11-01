//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

protocol MainAdapterDelegate: class {
    
    func numberOfItems(in adapter: MainAdapter) -> Int
    
    func mainAdapter(_ adapter: MainAdapter, itemAt index: Int) -> Any
    
    func mainAdapter(_ adapter: MainAdapter, didSelectAt index: Int)
}

class MainAdapter: NSObject, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    weak var collectionView: UICollectionView!
    weak var delegate: MainAdapterDelegate!
    
    convenience init(_ collectionView: UICollectionView, delegate: MainAdapterDelegate) {
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MainCell
        cell.indexPath = indexPath
        cell.delegate = self
        cell.item = delegate.mainAdapter(self, itemAt: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        delegate.mainAdapter(self, didSelectAt: indexPath.row)
    }
}

extension MainAdapter: MainCellDelegate {
    
}
