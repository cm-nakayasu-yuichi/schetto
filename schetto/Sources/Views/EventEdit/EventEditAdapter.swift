//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

protocol EventEditAdapterDelegate: class {
    
    func numberOfItems(in adapter: EventEditAdapter) -> Int
    
    func eventEditAdapter(_ adapter: EventEditAdapter, itemAt index: Int) -> Any
    
    func eventEditAdapter(_ adapter: EventEditAdapter, didSelectAt index: Int)
}

class EventEditAdapter: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    weak var tableView: UITableView!
    weak var delegate: EventEditAdapterDelegate!
    
    convenience init(_ tableView: UITableView, delegate: EventEditAdapterDelegate) {
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EventEditCell
        cell.indexPath = indexPath
        cell.delegate = self
        cell.item = delegate.eventEditAdapter(self, itemAt: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate.eventEditAdapter(self, didSelectAt: indexPath.row)
    }
}

extension EventEditAdapter: EventEditCellDelegate {
    
}
