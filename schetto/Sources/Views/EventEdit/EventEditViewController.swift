//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class EventEditViewController: UIViewController {

    var presenter: EventEditPresenterProtocol!
    
    private var adapter: EventEditAdapter!
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var closeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        adapter = EventEditAdapter(tableView, delegate: self)
    }
    
    @IBAction private func didTapCloseButton() {
        // NOP.
    }
}

extension EventEditViewController: EventEditViewProtocol {

}

extension EventEditViewController: EventEditAdapterDelegate {
    
    func numberOfItems(in adapter: EventEditAdapter) -> Int {
        return 20
//        return presenter.items.count
    }
    
    func eventEditAdapter(_ adapter: EventEditAdapter, itemAt index: Int) -> Any {
        return "hoge"
//        return presenter.items[index]
    }
    
    func eventEditAdapter(_ adapter: EventEditAdapter, didSelectAt index: Int) {
        // NOP.
    }
}
