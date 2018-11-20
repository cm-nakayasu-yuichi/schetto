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
    
    func todoDetailAdapter(_ adapter: TodoDetailAdapter, didTapAddAsset todo: TodoModel?)
    
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
        case addAsset
        case delete
        
        var assetModel: AssetModel? {
            switch self { case .asset(let model): return model; default: return nil }
        }
        
        var title: String {
            switch self {
            case .limit: return "期限"
            case .registered: return "登録日時"
            case .notify: return "通知"
            default: return ""
            }
        }
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
        bind(cell: cell, at: indexPath)
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
            [.title, .limit, .summery],
            [.priority, .registered],
            [.notify]
        ]
        
        if let assets = todo?.assets, !assets.isEmpty {
            let assetsItems = assets.map { asset -> RowItem in
                RowItem.asset(model: asset)
            }
            ret.append(assetsItems)
        } else {
            ret.append([.addAsset])
        }
        
        if todo != nil {
            ret.append([.delete])
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
        case .addAsset: return "add-asset"
        case .delete: return "delete"
        }
    }
    
    private func rowItemAt(_ indexPath: IndexPath) -> RowItem {
        return sectionsItems[indexPath.section][indexPath.row]
    }
    
    private func bind(cell original: UITableViewCell, at indexPath: IndexPath) {
        if let cell = original as? TodoDetailCell {
            cell.delegate = self
        }
        
        if let cell = original as? TodoDetailTitleCell {
            cell.check = true
            cell.title = todo?.title ?? ""
        }
        else if let cell = original as? TodoDetailSummeryCell {
            cell.summery = todo?.summery ?? ""
        }
        else if let cell = original as? TodoDetailKeyValueCell {
            cell.indexPath = indexPath
            let rowItem = rowItemAt(indexPath)
            bindKeyValue(cell: cell, rowItem: rowItem)
        }
        else if let cell = original as? TodoDetailPriorityCell {
            cell.priority = todo?.priority ?? .normal
        }
        else if let cell = original as? TodoDetailAssetCell {
            cell.indexPath = indexPath
            cell.assetImage = nil
        }
    }
    
    private func bindKeyValue(cell: TodoDetailKeyValueCell, rowItem: RowItem) {
        cell.title = rowItem.title
        cell.editable = keyValueEditable(rowItem: rowItem)
        
        switch rowItem {
        case .limit:
            cell.value = TodoModel.limitText(model: todo)
        case .registered:
            cell.value = "TODO:登録日時"
        case .notify:
            cell.value = "TODO:通知"
        default:
            return
        }
    }
    
    private func keyValueEditable(rowItem: RowItem) -> Bool {
        switch rowItem {
        case .limit, .notify: return true
        default: return false
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
    
    func didSelectKeyValue(at cell: TodoDetailCell, indexPath: IndexPath) {
        switch rowItemAt(indexPath) {
        case .limit:
            delegate.todoDetailAdapter(self, didSelectLimit: todo)
        case .notify:
            delegate.todoDetailAdapter(self, didSelectNotify: todo)
        default:
            return
        }
    }
    
    func didSelectNotify(at cell: TodoDetailCell) {
        delegate.todoDetailAdapter(self, didSelectNotify: todo)
    }
    
    func didTapAsset(at cell: TodoDetailCell, indexPath: IndexPath) {
        if let asset = rowItemAt(indexPath).assetModel {
            delegate.todoDetailAdapter(self, didTapAsset: asset, todo: todo)
        }
    }
    
    func didTapAddAsset(at cell: TodoDetailCell) {
        delegate.todoDetailAdapter(self, didTapAddAsset: todo)
    }
    
    func didTapDelete(at cell: TodoDetailCell) {
        delegate.todoDetailAdapter(self, didTapDelete: todo)
    }
}
