//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

protocol DrawerMenuAdapterDelegate: class {
    
    func numberOfItems(in adapter: DrawerMenuAdapter) -> Int
    
    func drawerMenuAdapter(_ adapter: DrawerMenuAdapter, itemAt index: Int) -> Any
    
    func drawerMenuAdapter(_ adapter: DrawerMenuAdapter, didSelectAt index: Int)
}

class DrawerMenuAdapter: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    weak var tableView: UITableView!
    weak var delegate: DrawerMenuAdapterDelegate!
    
    convenience init(_ tableView: UITableView, delegate: DrawerMenuAdapterDelegate) {
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DrawerMenuCell
        cell.indexPath = indexPath
        cell.delegate = self
        cell.item = delegate.drawerMenuAdapter(self, itemAt: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate.drawerMenuAdapter(self, didSelectAt: indexPath.row)
    }
}

extension DrawerMenuAdapter: DrawerMenuCellDelegate {
    
}
