//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class TodoListViewController: UIViewController {
    
    var presenter: TodoListPresenterProtocol!
    
    private var adapter: TodoListAdapter!
    private var todoListModels = [TodoListModel]()
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var closeButton: UIButton!
    @IBOutlet private weak var sortTypeSegment: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "タスク"
        adapter = TodoListAdapter(tableView, delegate: self)
        
        setupSortTypeSegment()
        setupCloseButtonOnNavigationBar()
    }
    
    @IBAction private func didChangeSortTypeSegment() {
        presenter.fetchList(sortType: sortType)
    }
    
    private func setupSortTypeSegment() {
        sortTypeSegment.removeAllSegments()
        TodoSortType.types.enumerated().forEach { i, type in
            sortTypeSegment.insertSegment(withTitle: type.title, at: i, animated: false)
        }
        presenter.fetchStoredSortType()
    }
    
    private var sortType: TodoSortType {
        let index = sortTypeSegment.selectedSegmentIndex
        return TodoSortType(rawValue: index)!
    }
}

extension TodoListViewController: TodoListViewProtocol {
    
    func fetched(list: [TodoListModel]) {
        tableView.reloadData()
    }
    
    func fetched(storedSortType: TodoSortType) {
        sortTypeSegment.selectedSegmentIndex = storedSortType.rawValue
    }
}

extension TodoListViewController: TodoListAdapterDelegate {
    
    func numberOfSections(_ adapter: TodoListAdapter) -> Int {
        return todoListModels.count
    }
    
    func numberOfTodos(_ adapter: TodoListAdapter, in section: Int) -> Int {
        return todoListModels[section].todos.count
    }
    
    func todoListAdapter(_ adapter: TodoListAdapter, titleForSection section: Int) -> String {
        return todoListModels[section].title
    }
    
    func todoListAdapter(_ adapter: TodoListAdapter, todoAt index: Int, in section: Int) -> TodoModel? {
        return todoListModels[section].todos[index]
    }
    
    func todoListAdapter(_ adapter: TodoListAdapter, didTapCompleteAt index: Int, in section: Int, to value: Bool) {
        
    }
    
    func todoListAdapter(_ adapter: TodoListAdapter, didSelectAt index: Int) {
        Wireframe.showTodoDetail(from: self)
    }
}
