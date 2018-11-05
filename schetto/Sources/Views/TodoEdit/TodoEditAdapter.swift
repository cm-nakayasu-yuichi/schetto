//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

protocol TodoEditAdapterDelegate: class {
    
    func numberOfItems(in adapter: TodoEditAdapter) -> Int
    
    func todoEditAdapter(_ adapter: TodoEditAdapter, itemAt index: Int) -> Any
    
    func todoEditAdapter(_ adapter: TodoEditAdapter, didSelectAt index: Int)
}

class TodoEditAdapter: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    weak var tableView: UITableView!
    weak var delegate: TodoEditAdapterDelegate!
    
    convenience init(_ tableView: UITableView, delegate: TodoEditAdapterDelegate) {
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TodoEditCell
        cell.indexPath = indexPath
        cell.delegate = self
        cell.item = delegate.todoEditAdapter(self, itemAt: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate.todoEditAdapter(self, didSelectAt: indexPath.row)
    }
}

extension TodoEditAdapter: TodoEditCellDelegate {
    
}
