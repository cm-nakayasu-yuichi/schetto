//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class EventViewController: UIViewController {

    var presenter: EventPresenterProtocol!
    var event: EventModel?
    
    private var adapter: EventAdapter!
    private var editEvent: EventModel!
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var toolbar: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "予定"
        setupCloseButtonOnNavigationBar()
        toolbar.dropShadowTop()
        presenter.fetchEditableEvent(from: event)
    }
    
    @IBAction private func didTapCloseButton() {
        // NOP.
    }
}

extension EventViewController: EventViewProtocol {
    
    func fetchedEditable(event: EventModel) {
        editEvent = event
        adapter = EventAdapter(tableView, event: editEvent, delegate: self)
    }
    
    func registered() {
        
    }
    
    func removed() {
        
    }
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
