//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

protocol TodoListAdapterDelegate: class {
    
    func numberOfItems(in adapter: TodoListAdapter) -> Int
    
    func todoListAdapter(_ adapter: TodoListAdapter, itemAt index: Int) -> Any
    
    func todoListAdapter(_ adapter: TodoListAdapter, didSelectAt index: Int)
}

class TodoListAdapter: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    weak var tableView: UITableView!
    weak var delegate: TodoListAdapterDelegate!
    
    convenience init(_ tableView: UITableView, delegate: TodoListAdapterDelegate) {
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TodoListCell
        cell.indexPath = indexPath
        cell.delegate = self
        cell.item = delegate.todoListAdapter(self, itemAt: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate.todoListAdapter(self, didSelectAt: indexPath.row)
    }
}

extension TodoListAdapter: TodoListCellDelegate {
    
}
