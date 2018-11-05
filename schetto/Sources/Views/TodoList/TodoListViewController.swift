//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class TodoListViewController: UIViewController {

    var presenter: TodoListPresenterProtocol!
    
    private var adapter: TodoListAdapter!
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var closeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        adapter = TodoListAdapter(tableView, delegate: self)
    }
    
    @IBAction private func didTapCloseButton() {
        // NOP.
    }
}

extension TodoListViewController: TodoListViewProtocol {

}

extension TodoListViewController: TodoListAdapterDelegate {
    
    func numberOfItems(in adapter: TodoListAdapter) -> Int {
        return 20
//        return presenter.items.count
    }
    
    func todoListAdapter(_ adapter: TodoListAdapter, itemAt index: Int) -> Any {
        return "hoge"
//        return presenter.items[index]
    }
    
    func todoListAdapter(_ adapter: TodoListAdapter, didSelectAt index: Int) {
        // NOP.
    }
}
