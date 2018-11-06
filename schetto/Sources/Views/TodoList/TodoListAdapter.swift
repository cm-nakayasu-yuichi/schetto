//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

protocol TodoListAdapterDelegate: class {
    
    func numberOfSections(_ adapter: TodoListAdapter) -> Int
    
    func numberOfTodos(_ adapter: TodoListAdapter, in section: Int) -> Int
    
    func todoListAdapter(_ adapter: TodoListAdapter, titleForSection section: Int) -> String
    
    func todoListAdapter(_ adapter: TodoListAdapter, todoAt index: Int, in section: Int) -> TodoModel?
    
    func todoListAdapter(_ adapter: TodoListAdapter, didTapCompleteAt index: Int, in section: Int, to value: Bool)
    
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return delegate?.numberOfSections(self) ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let num = delegate?.numberOfTodos(self, in: section) {
            return num + 1 // 1 = section title cell
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "title", for: indexPath) as! TodoListTitleCell
            cell.title = delegate?.todoListAdapter(self, titleForSection: indexPath.section) ?? ""
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TodoListCell
            cell.indexPath = indexPath
            cell.delegate = self
            //cell.todo = delegate?.todoListAdapter(self, todoAt: indexPath.row - 1, in: indexPath.section)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate.todoListAdapter(self, didSelectAt: indexPath.row)
    }
}

extension TodoListAdapter: TodoListCellDelegate {
    
}
