//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class TodoDetailViewController: UIViewController {
        
    var presenter: TodoDetailPresenterProtocol!
    
    private var adapter: TodoDetailAdapter!
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var closeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        adapter = TodoDetailAdapter(tableView, todo: nil, delegate: self)
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
        print("didTapEditTitle")
    }
    
    func todoDetailAdapter(_ adapter: TodoDetailAdapter, didTapEditSummery todo: TodoModel?) {
        print("didTapEditSummery")
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
        print("didTapDelete")
    }
}
