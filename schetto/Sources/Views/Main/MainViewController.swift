//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class MainViewController: UIViewController {

    var presenter: MainPresenterProtocol!
    
    private var adapter: MainAdapter!
    
    //@IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var closeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        //adapter = MainAdapter(collectionView, delegate: self)
    }
    
    @IBAction private func didTapCloseButton() {
        // NOP.
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
