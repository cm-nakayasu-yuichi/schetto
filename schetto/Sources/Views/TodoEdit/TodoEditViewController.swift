//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class TodoEditViewController: UIViewController {

    var presenter: TodoEditPresenterProtocol!
    
    private var adapter: TodoEditAdapter!
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var closeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        adapter = TodoEditAdapter(tableView, delegate: self)
    }
    
    @IBAction private func didTapCloseButton() {
        // NOP.
    }
}

extension TodoEditViewController: TodoEditViewProtocol {

}

extension TodoEditViewController: TodoEditAdapterDelegate {
    
    func numberOfItems(in adapter: TodoEditAdapter) -> Int {
        return 20
//        return presenter.items.count
    }
    
    func todoEditAdapter(_ adapter: TodoEditAdapter, itemAt index: Int) -> Any {
        return "hoge"
//        return presenter.items[index]
    }
    
    func todoEditAdapter(_ adapter: TodoEditAdapter, didSelectAt index: Int) {
        // NOP.
    }
}
