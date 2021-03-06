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
            (title: "TODO", handler: { bootstrap in
                Wireframe.showTodoList(from: bootstrap)
            }),
            (title: "WEBビュー", handler: { bootstrap in
				Wireframe.showWeb(from: bootstrap, urlString: "https://dev.classmethod.jp/author/nakayasu-yuichi/")
            }),
            (title: "日付選択", handler: { bootstrap in
                Wireframe.showDatePicker(from: bootstrap, dateTime: .now, title: "日付を選ぶ") { date in
                    print(date.string())
                }
            }),
            (title: "テスト", handler: { bootstrap in
                Wireframe.showTest(from: bootstrap)
            }),
            (title: "場所検索", handler: { bootstrap in
                Wireframe.showLocationSearch(from: bootstrap, location: "ss", title: "探す") { t, t2 in
                    print(t2)
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
