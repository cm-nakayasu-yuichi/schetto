//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

protocol EventAdapterDelegate: class {
    
    func eventAdapter(_ adapter: EventAdapter, didTapEditTitle event: EventModel)
    
    func eventAdapter(_ adapter: EventAdapter, didTapEditStartDate event: EventModel)
    
    func eventAdapter(_ adapter: EventAdapter, didTapEditEndDate event: EventModel)
    
    func eventAdapter(_ adapter: EventAdapter, didTapAllDay event: EventModel, toValue value: Bool)
    
    func eventAdapter(_ adapter: EventAdapter, didTapEditSummery event: EventModel)
    
    func eventAdapter(_ adapter: EventAdapter, didSelectNotify event: EventModel)
    
    func eventAdapter(_ adapter: EventAdapter, didTapAsset asset: AssetModel, event: EventModel)
    
    func eventAdapter(_ adapter: EventAdapter, didTapDeleteAsset asset: AssetModel, event: EventModel)
    
    
}
/*
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
*/

class EventAdapter: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    enum RowItem {
        case summery
        case notify
        case repeating
        case asset(model: AssetModel)
        case addAsset
        case delete
        
        var assetModel: AssetModel? {
            switch self { case .asset(let model): return model; default: return nil }
        }
    }
    
    weak var tableView: UITableView!
    weak var delegate: EventAdapterDelegate!
    
    private var event: EventModel!
    
    convenience init(_ tableView: UITableView, event: EventModel, delegate: EventAdapterDelegate) {
        self.init()
        self.tableView = tableView
        self.delegate = delegate
        self.event = event
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate.numberOfItems(in: self)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EventCell
        cell.indexPath = indexPath
        cell.delegate = self
        cell.item = delegate.eventAdapter(self, itemAt: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate.eventAdapter(self, didSelectAt: indexPath.row)
    }
}

extension EventAdapter: EventCellDelegate {
    
}
