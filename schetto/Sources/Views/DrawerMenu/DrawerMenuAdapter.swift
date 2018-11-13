//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

protocol DrawerMenuAdapterDelegate: class {
    
    func numberOfCalendars(in adapter: DrawerMenuAdapter) -> Int
    
    func drawerMenuAdapter(_ adapter: DrawerMenuAdapter, calendarTitleAt index: Int) -> String
    
    func drawerMenuAdapter(_ adapter: DrawerMenuAdapter, didSelect item: DrawerMenuItem)
    
    func drawerMenuAdapter(_ adapter: DrawerMenuAdapter, didSelect calendar: Any?)
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return DrawerMenuItemSection.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sec = DrawerMenuItemSection.sections[section]
        
        var count = sec.items.count
        if sec == .calendars {
            count += delegate.numberOfCalendars(in: self)
        }
        return count + 1 // 1 = header section cell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = DrawerMenuItemSection.sections[indexPath.section]
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "section", for: indexPath) as! DrawerMenuSectionCell
            cell.title = section.title
            return cell
        } else if section == .calendars {
            let cell = tableView.dequeueReusableCell(withIdentifier: "item", for: indexPath) as! DrawerMenuCell
            return cell
        } else {
            let item = section.items[indexPath.row - 1]
            let cell = tableView.dequeueReusableCell(withIdentifier: "item", for: indexPath) as! DrawerMenuCell
            cell.delegate = self
            cell.item = item
            return cell
        }
    }
}

extension DrawerMenuAdapter: DrawerMenuCellDelegate {
    
}
