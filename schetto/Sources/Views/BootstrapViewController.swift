//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class BootstrapViewController: UITableViewController {
    
    // ここに定義します
    // =========================================================================
    private let items: [(section: String, rows: [(title: String, handler: (UIViewController) -> Void)])] = [
        (section: "アプリ",
         rows: [
            (title: "アプリ起動", handler: { bootstrap in
                Wireframe.showEventEdit(from: bootstrap)
            }),
            ]),
        (section: "テスト",
         rows: [
            (title: "テストUI", handler: { bootstrap in
                Wireframe.showTest(from: bootstrap)
            }),
            (title: "画像テスト", handler: { bootstrap in
                UIApplication.appDelegate.pushNotification.register()
                UIApplication.appDelegate.pushNotification.createLocalPushNotificationRequest() { req in
                    UIApplication.appDelegate.pushNotification.request(req)
                }
            }),
            ]),
        ]
    // =========================================================================
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].rows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.section].rows[indexPath.row].title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        items[indexPath.section].rows[indexPath.row].handler(self)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return items[section].section
    }
}
