//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

protocol EventAdapterDelegate: class {
    
    func numberOfItems(in adapter: EventAdapter) -> Int
    
    func eventAdapter(_ adapter: EventAdapter, itemAt index: Int) -> Any
    
    func eventAdapter(_ adapter: EventAdapter, didSelectAt index: Int)
}

class EventAdapter: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    weak var tableView: UITableView!
    weak var delegate: EventAdapterDelegate!
    
    convenience init(_ tableView: UITableView, delegate: EventAdapterDelegate) {
        self.init()
        self.tableView = tableView
        self.delegate = delegate
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate.numberOfItems(in: self)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EventCell
        cell.indexPath = indexPath
        cell.delegate = self
        cell.item = delegate.eventAdapter(self, itemAt: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate.eventAdapter(self, didSelectAt: indexPath.row)
    }
}

extension EventAdapter: EventCellDelegate {
    
}
