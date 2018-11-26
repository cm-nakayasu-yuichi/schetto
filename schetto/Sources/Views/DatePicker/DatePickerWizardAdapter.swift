//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

protocol DatePickerWizardAdapterDelegate: class {
    
//    func numberOfCalendars(in adapter: DatePickerWizardAdapter) -> Int
//    
//    func drawerMenuAdapter(_ adapter: DatePickerWizardAdapter, calendarTitleAt index: Int) -> String
//    
//    func drawerMenuAdapter(_ adapter: DatePickerWizardAdapter, didSelect item: DrawerMenuItem)
//    
//    func drawerMenuAdapter(_ adapter: DatePickerWizardAdapter, didSelect calendar: Any?)
}

class DatePickerWizardAdapter: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    weak var tableView: UITableView!
    weak var delegate: DatePickerWizardAdapterDelegate!
    
    convenience init(_ tableView: UITableView, delegate: DatePickerWizardAdapterDelegate) {
        self.init()
        self.tableView = tableView
        self.delegate = delegate
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DatePickerWizardCell
        //cell.title = ""
        cell.delegate = self
        return cell
    }
}

extension DatePickerWizardAdapter: DatePickerWizardCellDelegete {
    
}
