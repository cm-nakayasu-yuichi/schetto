//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class TodoListViewController: UIViewController {
    
    var presenter: TodoListPresenterProtocol!
    
    private var adapter: TodoListAdapter!
    private var sortType: TodoSortType = .limit
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var closeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "タスク"
        adapter = TodoListAdapter(tableView, delegate: self)
    }
    
    @IBAction private func didTapCloseButton() {
        // NOP.
    }
}

extension TodoListViewController: TodoListViewProtocol {
    
}

extension TodoListViewController: TodoListAdapterDelegate {
    
    func numberOfSections(_ adapter: TodoListAdapter) -> Int {
        switch sortType {
        case .limit: return TodoLimitType.sortItems.count
        case .priority: return TodoPriority.sortItems.count
        }
    }
    
    func numberOfTodos(_ adapter: TodoListAdapter, in section: Int) -> Int {
        return 5 // TODO:
    }
    
    func todoListAdapter(_ adapter: TodoListAdapter, titleForSection section: Int) -> String {
        switch sortType {
        case .limit: return TodoLimitType.sortItems[section].title
        case .priority: return TodoPriority.sortItems[section].title
        }
    }
    
    func todoListAdapter(_ adapter: TodoListAdapter, todoAt index: Int, in section: Int) -> TodoModel? {
        return nil // TODO:
    }
    
    func todoListAdapter(_ adapter: TodoListAdapter, didTapCompleteAt index: Int, in section: Int, to value: Bool) {
        
    }
    
    func todoListAdapter(_ adapter: TodoListAdapter, didSelectAt index: Int) {
        Wireframe.showTodoDetail(from: self)
    }
}
