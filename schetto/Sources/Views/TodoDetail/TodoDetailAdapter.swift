//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

protocol TodoDetailAdapterDelegate: class {
    
    func numberOfItems(in adapter: TodoDetailAdapter) -> Int
    
    func todoDetailAdapter(_ adapter: TodoDetailAdapter, itemAt index: Int) -> Any
    
    func todoDetailAdapter(_ adapter: TodoDetailAdapter, didSelectAt index: Int)
}

class TodoDetailAdapter: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    weak var tableView: UITableView!
    weak var delegate: TodoDetailAdapterDelegate!
    
    convenience init(_ tableView: UITableView, delegate: TodoDetailAdapterDelegate) {
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TodoDetailCell
        cell.indexPath = indexPath
        cell.delegate = self
        cell.item = delegate.todoDetailAdapter(self, itemAt: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate.todoDetailAdapter(self, didSelectAt: indexPath.row)
    }
}

extension TodoDetailAdapter: TodoDetailCellDelegate {
    
}
