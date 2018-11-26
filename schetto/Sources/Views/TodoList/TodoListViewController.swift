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
    @IBOutlet private weak var sortTypeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var emptyView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "タスク"
        adapter = TodoListAdapter(tableView, delegate: self)
        
        setupSortTypeSegmentedControl()
        setupCloseButtonOnNavigationBar()
        setupAddButtonOnNavigationBar()
        setupEmptyView()
    }
    
    @IBAction private func didTapAddButton() {
        Wireframe.showTodoDetail(from: self, todo: nil)
    }
    
    @objc func didTapAddButtonOnNavigationBar() {
        Wireframe.showTodoDetail(from: self, todo: nil)
    }
    
    @IBAction private func didChangeSortTypeSegment() {
        presenter.fetchTodoList(sortType: sortType)
    }
    
    func setupAddButtonOnNavigationBar() {
        setRightBarButtonSystemItem(.add, selector: #selector(didTapAddButtonOnNavigationBar))
    }
    
    private func setupSortTypeSegmentedControl() {
        sortTypeSegmentedControl.removeAllSegments()
        TodoSortType.types.enumerated().forEach { i, type in
            sortTypeSegmentedControl.insertSegment(withTitle: type.title, at: i, animated: false)
        }
        presenter.fetchStoredSortType()
    }
    
    private var sortType: TodoSortType {
        let index = sortTypeSegmentedControl.selectedSegmentIndex
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
        sortTypeSegmentedControl.selectedSegmentIndex = storedSortType.rawValue
        presenter.fetchTodoList(sortType: sortType)
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
        todo.completed = completed
        presenter.register(todo)
    }
    
    func todoListAdapter(_ adapter: TodoListAdapter, didSelectTodo todo: TodoModel) {
        Wireframe.showTodoDetail(from: self, todo: todo)
    }
}
