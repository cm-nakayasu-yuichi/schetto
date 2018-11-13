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
    @IBOutlet private weak var sortTypeSegment: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "タスク"
        adapter = TodoListAdapter(tableView, delegate: self)
        
        setupSortTypeSegment()
        // 閉じるボタン設置
        setupCloseButtonOnNavigationBar()
    }
    
    @IBAction private func didChangeSortTypeSegment() {
        
    }
    
    private func setupSortTypeSegment() {
        sortTypeSegment.removeAllSegments()
        TodoSortType.types.enumerated().forEach { i, type in
            sortTypeSegment.insertSegment(withTitle: type.title, at: i, animated: false)
        }
        presenter.fetchStoredSortType()
    }
}

extension TodoListViewController: TodoListViewProtocol {
    
    func fetched(storedSortType: TodoSortType) {
        sortTypeSegment.selectedSegmentIndex = sortType.rawValue
    }
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
