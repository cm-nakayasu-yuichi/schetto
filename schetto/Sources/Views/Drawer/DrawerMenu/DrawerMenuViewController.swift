//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class DrawerMenuViewController: UIViewController {

    private var adapter: DrawerMenuAdapter!
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var closeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        adapter = DrawerMenuAdapter(tableView, delegate: self)
    }
    
    @IBAction private func didTapCloseButton() {
        // NOP.
    }
}

extension DrawerMenuViewController: DrawerMenuAdapterDelegate {

    func numberOfCalendars(in adapter: DrawerMenuAdapter) -> Int {
        return 4
    }
    
    func drawerMenuAdapter(_ adapter: DrawerMenuAdapter, calendarTitleAt index: Int) -> String {
        return "サンプルカレンダー"
    }
    
    func drawerMenuAdapter(_ adapter: DrawerMenuAdapter, didSelect item: DrawerMenuItem) {
        
    }
    
    func drawerMenuAdapter(_ adapter: DrawerMenuAdapter, didSelect calendar: Any?) {
        
    }
}
