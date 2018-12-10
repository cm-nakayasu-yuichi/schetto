//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

protocol ColorPickerAdapterDelegate: class {
    
    func colorPickerAdapter(_ adapter: ColorPickerAdapter, didSelectColor color: UIColor)
}

class ColorPickerAdapter: NSObject, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    weak var collectionView: UICollectionView!
    weak var delegate: ColorPickerAdapterDelegate!
    private var colors: [UIColor]!
    
    convenience init(_ collectionView: UICollectionView, delegate: ColorPickerAdapterDelegate, colors: [UIColor]) {
        self.init()
        self.collectionView = collectionView
        self.delegate = delegate
        self.colors = colors
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ColorPickerCell
        cell.delegate = self
        cell.index = indexPath.row
        cell.color = colors[indexPath.row]
        cell.isSelected = false
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.width / 6
        return CGSize(width, width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension ColorPickerAdapter: ColorPickerCellDelegate {
    
    func colorPickerCell(_ cell: ColorPickerCell, didTapColorButtonAt index: Int) {
        print(index)
        delegate.colorPickerAdapter(self, didSelectColor: self.colors[index])
    }
}
