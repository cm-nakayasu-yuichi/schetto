//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

protocol TodoDetailAdapterDelegate: class {
    
    func todoDetailAdapter(_ adapter: TodoDetailAdapter, didTapComplete todo: TodoModel?)
    
    func todoDetailAdapter(_ adapter: TodoDetailAdapter, didTapEditTitle todo: TodoModel?)
    
    func todoDetailAdapter(_ adapter: TodoDetailAdapter, didTapEditSummery todo: TodoModel?)
    
    func todoDetailAdapter(_ adapter: TodoDetailAdapter, didChangePriority priority: TodoPriority, todo: TodoModel?)
    
    func todoDetailAdapter(_ adapter: TodoDetailAdapter, didSelectLimit todo: TodoModel?)
    
    func todoDetailAdapter(_ adapter: TodoDetailAdapter, didSelectNotify todo: TodoModel?)
    
    func todoDetailAdapter(_ adapter: TodoDetailAdapter, didTapAsset asset: AssetModel?, todo: TodoModel?)
    
    func todoDetailAdapter(_ adapter: TodoDetailAdapter, didTapDelete todo: TodoModel?)
}

class TodoDetailAdapter: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    enum RowItem {
        case title
        case summery
        case limit
        case priority
        case registered
        case notify
        case asset(model: AssetModel)
        case delete
    }
    
    weak var tableView: UITableView!
    weak var delegate: TodoDetailAdapterDelegate!
    
    private var todo: TodoModel?
    
    convenience init(_ tableView: UITableView, todo: TodoModel?, delegate: TodoDetailAdapterDelegate) {
        self.init()
        self.todo = todo
        self.tableView = tableView
        self.delegate = delegate
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsItems.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionsItems[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowItem = rowItemAt(indexPath)
        let cellIdentifier = cellIdentifierOf(rowItem)
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        bind(cell: cell)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 6
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }
}

extension TodoDetailAdapter {
    
    private var sectionsItems: [[RowItem]] {
        var ret: [[RowItem]] = [
            [.title, .summery, .limit],
            [.priority, .registered],
            [.notify],
            // insert assets when exists
            [.delete],
        ]
        if let assets = todo?.assets, !assets.isEmpty {
            let assetsItems = assets.map { asset -> RowItem in
                RowItem.asset(model: asset)
            }
            ret.insert(assetsItems, at: 3) // 3 = under .notify
        }
        return ret
    }
    
    private func cellIdentifierOf(_ rowItem: RowItem) -> String {
        switch rowItem {
        case .title: return "title"
        case .summery: return "summery"
        case .limit, .registered, .notify: return "key-value"
        case .priority: return "priority"
        case .asset(_): return "asset"
        case .delete: return "delete"
        }
    }
    
    private func rowItemAt(_ indexPath: IndexPath) -> RowItem {
        return sectionsItems[indexPath.section][indexPath.row]
    }
    
    private func bind(cell original: UITableViewCell) {
        if let cell = original as? TodoDetailCell {
            cell.delegate = self
        }
        
        if let cell = original as? TodoDetailTitleCell {
            cell.check = true
            cell.title = todo?.title ?? "タイトル"
        }
        else if let cell = original as? TodoDetailSummeryCell {
            cell.summery = todo?.summery ?? "概要"
        }
        else if let cell = original as? TodoDetailKeyValueCell {
            cell.title = "キー"
            cell.value = "値"
        }
        else if let cell = original as? TodoDetailPriorityCell {
            cell.priority = todo?.priority ?? .normal
        }
        else if let cell = original as? TodoDetailAssetCell {
            cell.assetImage = nil
        }
    }
}

extension TodoDetailAdapter: TodoDetailCellDelegate {
    
    func didTapComplete(at cell: TodoDetailCell) {
        delegate.todoDetailAdapter(self, didTapComplete: todo)
    }
    
    func didTapEditTitle(at cell: TodoDetailCell) {
        delegate.todoDetailAdapter(self, didTapEditTitle: todo)
    }
    
    func didTapEditSummery(at cell: TodoDetailCell) {
        delegate.todoDetailAdapter(self, didTapEditSummery: todo)
    }
    
    func didChangePriority(at cell: TodoDetailCell, priority: TodoPriority) {
        delegate.todoDetailAdapter(self, didChangePriority: .normal, todo: todo) // TODO: priorityがnormal固定になっているのを直す
    }
    
    func didSelectLimit(at cell: TodoDetailCell) {
        delegate.todoDetailAdapter(self, didSelectLimit: todo)
    }
    
    func didSelectNotify(at cell: TodoDetailCell) {
        delegate.todoDetailAdapter(self, didSelectNotify: todo)
    }
    
    func didTapAsset(at cell: TodoDetailCell, asset: AssetModel?) {
        delegate.todoDetailAdapter(self, didTapAsset: nil, todo: todo) // TODO: Assetがnil固定になっているのを直す
    }
    
    func didTapDelete(at cell: TodoDetailCell) {
        delegate.todoDetailAdapter(self, didTapDelete: todo)
    }
}
