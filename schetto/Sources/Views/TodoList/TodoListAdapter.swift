//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

protocol TodoListAdapterDelegate: class {
    
    func numberOfSections(_ adapter: TodoListAdapter) -> Int
    
    func numberOfTodos(_ adapter: TodoListAdapter, in section: Int) -> Int
    
    func todoListAdapter(_ adapter: TodoListAdapter, titleForSection section: Int) -> String
    
    func todoListAdapter(_ adapter: TodoListAdapter, todoAt index: Int, in section: Int) -> TodoModel
    
    func todoListAdapter(_ adapter: TodoListAdapter, didTapComplete todo: TodoModel, to completed: Bool)
    
    func todoListAdapter(_ adapter: TodoListAdapter, didSelectTodo todo: TodoModel)
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
        return delegate.numberOfSections(self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate.numberOfTodos(self, in: section) + 1 // 1 = タイトル行用
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "title", for: indexPath) as! TodoListTitleCell
            cell.title = delegate.todoListAdapter(self, titleForSection: indexPath.section)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TodoListCell
            cell.delegate = self
            cell.todo = delegate.todoListAdapter(self, todoAt: indexPath.row - 1, in: indexPath.section)
            cell.isLastRow = isLastRow(at: indexPath)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 { return } // タイトル行は無視
        tableView.deselectRow(at: indexPath, animated: true)
        
        let todo = delegate.todoListAdapter(self, todoAt: indexPath.row - 1, in: indexPath.section)
        delegate.todoListAdapter(self, didSelectTodo: todo)
    }
    
    private func isLastRow(at indexPath: IndexPath) -> Bool {
        let lastIndex = tableView(tableView, numberOfRowsInSection: indexPath.section) - 1
        return indexPath.row == lastIndex
    }
}

extension TodoListAdapter: TodoListCellDelegate {
    
    func didTapComplete(of cell: TodoListCell, completed: Bool) {
        delegate.todoListAdapter(self, didTapComplete: cell.todo, to: completed)
    }
}
