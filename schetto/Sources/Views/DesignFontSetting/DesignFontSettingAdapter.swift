//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

protocol DesignFontSettingAdapterDelegate: class {
    
    func numberOfItems(in adapter: DesignFontSettingAdapter) -> Int
    
    func designFontSettingAdapter(_ adapter: DesignFontSettingAdapter, itemAt index: Int) -> Any
    
    func designFontSettingAdapter(_ adapter: DesignFontSettingAdapter, didSelectAt index: Int)
}

class DesignFontSettingAdapter: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    weak var tableView: UITableView!
    weak var delegate: DesignFontSettingAdapterDelegate!
    
    convenience init(_ tableView: UITableView, delegate: DesignFontSettingAdapterDelegate) {
        self.init()
        self.tableView = tableView
        self.delegate = delegate
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate.numberOfItems(in: self)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DesignFontSettingCell
        cell.indexPath = indexPath
        cell.delegate = self
        cell.item = delegate.designFontSettingAdapter(self, itemAt: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate.designFontSettingAdapter(self, didSelectAt: indexPath.row)
    }
}

extension DesignFontSettingAdapter: DesignFontSettingCellDelegate {
    
}
