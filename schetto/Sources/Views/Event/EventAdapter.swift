//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

protocol EventAdapterDelegate: class {
    
    func eventAdapterDidTapEditName(_ adapter: EventAdapter)
    
    func eventAdapterDidTapEditStartDate(_ adapter: EventAdapter)
    
    func eventAdapterDidTapEditEndDate(_ adapter: EventAdapter)
    
    func eventAdapterDidTapColor(_ adapter: EventAdapter)
    
    func eventAdapterDidTapSticker(_ adapter: EventAdapter)
    
    func eventAdapter(_ adapter: EventAdapter, didTapAllDay value: Bool)
    
    func eventAdapterDidTapEditSummery(_ adapter: EventAdapter)
    
    func eventAdapterDidTapEditLocation(_ adapter: EventAdapter)
    
    func eventAdapterDidSelectNotify(_ adapter: EventAdapter)
    
    func eventAdapter(_ adapter: EventAdapter, didTapAsset asset: AssetModel)
    
    func eventAdapterDidTapAddAsset(_ adapter: EventAdapter)
    
    func eventAdapter(_ adapter: EventAdapter, didTapDeleteAsset asset: AssetModel)
}

class EventAdapter: NSObject {

    enum RowItem {
        case name
        case date
        case info
        case summery
        case location
        case asset(model: AssetModel)
        case add
        
        var assetModel: AssetModel? {
            switch self { case .asset(let model): return model; default: return nil }
        }
    }
    
    weak var tableView: UITableView!
    weak var delegate: EventAdapterDelegate!
    
    private var event: EventModel!
    
    convenience init(_ tableView: UITableView, event: EventModel, delegate: EventAdapterDelegate) {
        self.init()
        self.event = event
        self.tableView = tableView
        self.delegate = delegate
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private var rowItems: [RowItem] {
        var ret: [RowItem] = [
            .name, .date, .info, .summery, .location,
        ]
        if !event.assets.isEmpty {
            ret.append(contentsOf: event.assets.map { asset -> RowItem in
                RowItem.asset(model: asset)
            })
        } else {
            ret.append(.add)
        }
        return ret
    }
    
    private func rowItemAt(_ indexPath: IndexPath) -> RowItem {
        return rowItems[indexPath.row]
    }
    
    private func cellIdentifierOf(_ rowItem: RowItem) -> String {
        switch rowItem {
        case .name, .summery, .location: return "text"
        case .date: return "date"
        case .info: return "info"
        case .asset(_): return "asset"
        case .add: return "add"
        }
    }
    
    private func bind(cell original: UITableViewCell, at indexPath: IndexPath) {
        if let cell = original as? EventTextCell {
            cell.delegate = self
            cell.indexPath = indexPath
            bindText(cell: cell, rowItem: rowItemAt(indexPath))
        }
        if let cell = original as? EventDateCell {
            cell.delegate = self
            cell.startDateText = event.startDateText
            cell.endDateText = event.endDateText
            cell.startTimeText = event.startTimeText
            cell.endTimeText = event.endTimeText
            
        }
        if let cell = original as? EventInfoCell {
            cell.delegate = self
            
            cell.stickerImage = nil
            cell.color = event.color
            cell.allDay = event.all
        }
        if let cell = original as? EventAssetCell {
            cell.delegate = self
            cell.asset = rowItemAt(indexPath).assetModel
        }
        if let cell = original as? EventAddAssetCell {
            cell.delegate = self
        }
    }
    
    private func bindText(cell: EventTextCell, rowItem: RowItem) {
        switch rowItem {
        case .name:
            cell.caption = "予定名"
            cell.value = event.name
        case .summery:
            cell.caption = "予定の概要・メモ"
            cell.value = event.summery
        case .location:
            cell.caption = "場所"
            cell.value = event.location
        default:
            return
        }
    }
}

extension EventAdapter: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowItem = rowItemAt(indexPath)
        let cellIdentifier = cellIdentifierOf(rowItem)
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        bind(cell: cell, at: indexPath)
        return cell
    }
}

extension EventAdapter: EventTextCellDelegate, EventDateCellDelegate, EventInfoCellDelegate, EventAssetCellDelegate, EventAddAssetCellDelegate {
    
    func didTapEditText(in cell: EventTextCell, at indexPath: IndexPath) {
        switch rowItemAt(indexPath) {
        case .name:
            delegate.eventAdapterDidTapEditName(self)
        case .summery:
            delegate.eventAdapterDidTapEditSummery(self)
        case .location:
            delegate.eventAdapterDidTapEditLocation(self)
        default: break
        }
    }
    
    func didTapStartDate(in cell: EventDateCell) {
        delegate.eventAdapterDidTapEditStartDate(self)
    }
    
    func didTapEndDate(in cell: EventDateCell) {
        delegate.eventAdapterDidTapEditEndDate(self)
    }
    
    func didTapColorButton(in cell: EventInfoCell) {
        delegate.eventAdapterDidTapColor(self)
    }
    
    func didTapStickerButton(in cell: EventInfoCell) {
        delegate.eventAdapterDidTapSticker(self)
    }
    
    func didChangeAllDay(in cell: EventInfoCell, to value: Bool) {
        delegate.eventAdapter(self, didTapAllDay: value)
    }
    
    func didTapAsset(in cell: EventAssetCell, asset: AssetModel) {
        delegate.eventAdapter(self, didTapAsset: asset)
    }
    
    func didTapDeleteAsset(in cell: EventAssetCell, asset: AssetModel) {
        delegate.eventAdapter(self, didTapDeleteAsset: asset)
    }
    
    func didTapAddAsset(in cell: EventAddAssetCell) {
        delegate.eventAdapterDidTapAddAsset(self)
    }
}
