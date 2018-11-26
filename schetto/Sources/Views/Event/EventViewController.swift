//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class EventViewController: UIViewController {

    var presenter: EventPresenterProtocol!
    
    private var adapter: EventAdapter!
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var toolbar: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCloseButtonOnNavigationBar()
        toolbar.dropShadowTop()
        adapter = EventAdapter(tableView, delegate: self)
    }
    
    @IBAction private func didTapCloseButton() {
        // NOP.
    }
}

extension EventViewController: EventViewProtocol {

}

extension EventViewController: EventAdapterDelegate {
    
    func numberOfItems(in adapter: EventAdapter) -> Int {
        return 20
//        return presenter.items.count
    }
    
    func eventAdapter(_ adapter: EventAdapter, itemAt index: Int) -> Any {
        return "hoge"
//        return presenter.items[index]
    }
    
    func eventAdapter(_ adapter: EventAdapter, didSelectAt index: Int) {
        // NOP.
    }
}
