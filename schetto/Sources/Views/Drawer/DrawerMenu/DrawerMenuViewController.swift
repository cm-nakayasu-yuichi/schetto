//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class DrawerMenuViewController: UIViewController {

    private var adapter: DrawerMenuAdapter!
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var closeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        adapter = DrawerMenuAdapter(tableView, delegate: self)
    }
    
    @IBAction private func didTapCloseButton() {
        // NOP.
    }
}

extension DrawerMenuViewController: DrawerMenuAdapterDelegate {
    
    func numberOfItems(in adapter: DrawerMenuAdapter) -> Int {
        return 20
//        return presenter.items.count
    }
    
    func drawerMenuAdapter(_ adapter: DrawerMenuAdapter, itemAt index: Int) -> Any {
        return "hoge"
//        return presenter.items[index]
    }
    
    func drawerMenuAdapter(_ adapter: DrawerMenuAdapter, didSelectAt index: Int) {
        // NOP.
    }
}
