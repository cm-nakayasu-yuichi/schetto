//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class TodoDetailViewController: UIViewController {
        
    var presenter: TodoDetailPresenterProtocol!
    var todo: TodoModel?
    
    private var adapter: TodoDetailAdapter!
    private var editTodo: TodoModel!
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var saveButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "タスク詳細"
        presenter.fetchEditableTodo(from: todo)
    }
    
    @IBAction private func didTapSaveButton() {
        
    }
}

extension TodoDetailViewController: TodoDetailViewProtocol {
    
    func fetchedEditable(todo: TodoModel) {
        editTodo = todo
        adapter = TodoDetailAdapter(tableView, todo: editTodo, delegate: self)
    }
    
    func registered() {
        
    }
    
    func removed() {
        
    }
}

extension TodoDetailViewController: TodoDetailAdapterDelegate {
    
    func todoDetailAdapter(_ adapter: TodoDetailAdapter, didTapComplete todo: TodoModel?) {
        editTodo.completed = !editTodo.completed
    }
    
    func todoDetailAdapter(_ adapter: TodoDetailAdapter, didTapEditTitle todo: TodoModel?) {
        let options = TextViewControllerOptions(
            title: "タスクのタイトル",
            placeholder: "タスクのタイトルを入力してください",
            text: editTodo.title,
            multiLine: false
        )
        Wireframe.showText(from: self, options: options) { [unowned self] text in
            self.editTodo.title = text
            self.tableView.reloadData()
        }
    }
    
    func todoDetailAdapter(_ adapter: TodoDetailAdapter, didTapEditSummery todo: TodoModel?) {
        let options = TextViewControllerOptions(
            title: "タスクの概要",
            placeholder: "タスクの概要を入力してください",
            text: editTodo.summery,
            multiLine: true
        )
        Wireframe.showText(from: self, options: options) { [unowned self] text in
            self.editTodo.summery = text
            self.tableView.reloadData()
        }
    }
    
    func todoDetailAdapter(_ adapter: TodoDetailAdapter, didChangePriority priority: TodoPriority, todo: TodoModel?) {
        print("didChangePriority")
    }
    
    func todoDetailAdapter(_ adapter: TodoDetailAdapter, didSelectLimit todo: TodoModel?) {
        print("didSelectLimit")
    }
    
    func todoDetailAdapter(_ adapter: TodoDetailAdapter, didSelectNotify todo: TodoModel?) {
        print("didSelectNotify")
    }
    
    func todoDetailAdapter(_ adapter: TodoDetailAdapter, didTapAsset asset: AssetModel?, todo: TodoModel?) {
        print("didTapAsset")
    }
    
    func todoDetailAdapter(_ adapter: TodoDetailAdapter, didTapAddAsset todo: TodoModel?) {
        print("didTapAddAsset")
    }
    
    func todoDetailAdapter(_ adapter: TodoDetailAdapter, didTapDelete todo: TodoModel?) {
        Wireframe.showConfirmDeleteTodo(from: self) {
            Wireframe.pop(from: self)
        }
    }
}
