//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

protocol TutorialAdapterDelegate: class {
    
    func numberOfItems(in adapter: TutorialAdapter) -> Int
    
    func tutorialAdapter(_ adapter: TutorialAdapter, itemAt index: Int) -> Any
    
    func tutorialAdapter(_ adapter: TutorialAdapter, didScrollAt x: CGFloat)
}

class TutorialAdapter: NSObject, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    weak var collectionView: UICollectionView!
    weak var delegate: TutorialAdapterDelegate!
    
    convenience init(_ collectionView: UICollectionView, delegate: TutorialAdapterDelegate) {
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TutorialCell
        cell.indexPath = indexPath
        cell.delegate = self
        cell.item = delegate.tutorialAdapter(self, itemAt: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        delegate.tutorialAdapter(self, didScrollAt: scrollView.contentOffset.x)
    }
}

extension TutorialAdapter: TutorialCellDelegate {
    
}
