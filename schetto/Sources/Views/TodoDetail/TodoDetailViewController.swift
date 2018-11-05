//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class TodoDetailViewController: UIViewController {

    var presenter: TodoDetailPresenterProtocol!
    
    private var adapter: TodoDetailAdapter!
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var closeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        adapter = TodoDetailAdapter(tableView, delegate: self)
    }
    
    @IBAction private func didTapCloseButton() {
        // NOP.
    }
}

extension TodoDetailViewController: TodoDetailViewProtocol {

}

extension TodoDetailViewController: TodoDetailAdapterDelegate {
    
    func numberOfItems(in adapter: TodoDetailAdapter) -> Int {
        return 20
//        return presenter.items.count
    }
    
    func todoDetailAdapter(_ adapter: TodoDetailAdapter, itemAt index: Int) -> Any {
        return "hoge"
//        return presenter.items[index]
    }
    
    func todoDetailAdapter(_ adapter: TodoDetailAdapter, didSelectAt index: Int) {
        // NOP.
    }
}
