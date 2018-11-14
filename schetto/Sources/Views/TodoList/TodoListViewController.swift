//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class TodoListViewController: UIViewController, EmptyViewControllable {
    
    var presenter: TodoListPresenterProtocol!
    
    private var adapter: TodoListAdapter!
    private var todoListModels = [TodoListModel]()
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var closeButton: UIButton!
    @IBOutlet private weak var sortTypeSegment: UISegmentedControl!
    @IBOutlet weak var emptyView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "タスク"
        adapter = TodoListAdapter(tableView, delegate: self)
        
        setupSortTypeSegment()
        setupCloseButtonOnNavigationBar()
        setupAddButtonOnNavigationBar()
        setupEmptyView()
    }
    
    @IBAction private func didTapAddButton() {
        
    }
    
    override func didTapAddButtonOnNavigationBar() {
        
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
    
    func show(todoListModels: [TodoListModel]) {
        self.todoListModels = todoListModels
        emptyView.isHidden = true
        tableView.isHidden = false
        tableView.reloadData()
    }
    
    func showEmpty() {
        self.todoListModels = []
        emptyView.isHidden = false
        tableView.isHidden = true
        tableView.reloadData()
    }
    
    func fetched(storedSortType: TodoSortType) {
        sortTypeSegment.selectedSegmentIndex = storedSortType.rawValue
        presenter.fetchList(sortType: sortType)
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
    
    func todoListAdapter(_ adapter: TodoListAdapter, todoAt index: Int, in section: Int) -> TodoModel {
        return todoListModels[section].todos[index]
    }
    
    func todoListAdapter(_ adapter: TodoListAdapter, didTapComplete todo: TodoModel, to completed: Bool) {
        
    }
    
    func todoListAdapter(_ adapter: TodoListAdapter, didSelectTodo todo: TodoModel) {
        Wireframe.showTodoDetail(from: self)
    }
}
