//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class TodoDetailViewController: UIViewController {
        
    var presenter: TodoDetailPresenterProtocol!
    var todo: TodoModel?
    
    private var adapter: TodoDetailAdapter!
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var closeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "タスク詳細"
        adapter = TodoDetailAdapter(tableView, todo: todo, delegate: self)
    }
    
    @IBAction private func didTapCloseButton() {
        // NOP.
    }
}

extension TodoDetailViewController: TodoDetailViewProtocol {
    
}

extension TodoDetailViewController: TodoDetailAdapterDelegate {
    
    func todoDetailAdapter(_ adapter: TodoDetailAdapter, didTapComplete todo: TodoModel?) {
        print("didTapComplete")
    }
    
    func todoDetailAdapter(_ adapter: TodoDetailAdapter, didTapEditTitle todo: TodoModel?) {
        let options = TextViewControllerOptions(
            title: "タスクのタイトル",
            placeholder: "タスクのタイトルを入力してください",
            text: todo?.title ?? "",
            multiLine: false
        )
        Wireframe.showText(from: self, options: options) { [unowned self] text in
            todo?.title = text
            self.tableView.reloadData()
        }
    }
    
    func todoDetailAdapter(_ adapter: TodoDetailAdapter, didTapEditSummery todo: TodoModel?) {
        let options = TextViewControllerOptions(
            title: "タスクの概要",
            placeholder: "タスクの概要を入力してください",
            text: todo?.summery ?? "",
            multiLine: true
        )
        Wireframe.showText(from: self, options: options) { [unowned self] text in
            todo?.summery = text
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
    
    func todoDetailAdapter(_ adapter: TodoDetailAdapter, didTapDelete todo: TodoModel?) {
        Wireframe.showConfirmDeleteTodo(from: self) {
            Wireframe.pop(from: self)
        }
    }
}
