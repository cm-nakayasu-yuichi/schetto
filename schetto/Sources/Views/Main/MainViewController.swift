//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class MainViewController: UIViewController {

    var presenter: MainPresenterProtocol!
    
    private var adapter: MainAdapter!
    
    @IBOutlet private weak var backgroundImageView: UIImageView!
    //@IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var menuButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundImageView()
        //adapter = MainAdapter(collectionView, delegate: self)
    }
    
    @IBAction private func didTapMenuButton() {
        // NOP.
    }
    
    private func setupBackgroundImageView() {
        let ratioWidth: CGFloat = 320
        let ratioHeight: CGFloat = 568
        
        var width: CGFloat = .screenWidth
        var height: CGFloat = .screenWidth * (ratioHeight / ratioWidth)
        if height < .screenHeight {
            height = .screenHeight
            width = .screenHeight * (ratioWidth / ratioHeight)
        }
        
        _ = backgroundImageView.addConstraint(width: width)
        _ = backgroundImageView.addConstraint(height: height)
    }
}

extension MainViewController: MainViewProtocol {

}

extension MainViewController: MainAdapterDelegate {
    
    func numberOfItems(in adapter: MainAdapter) -> Int {
        return 20
//        return presenter.items.count
    }
    
    func mainAdapter(_ adapter: MainAdapter, itemAt index: Int) -> Any {
        return "hoge"
//        return presenter.items[index]
    }
    
    func mainAdapter(_ adapter: MainAdapter, didSelectAt index: Int) {
        // NOP.
    }
}
