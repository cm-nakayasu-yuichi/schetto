//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit
import MapKit

class LocationSearchViewController: UIViewController {
    
    typealias CommitHandler = (String, String) -> () // 地名, 住所等の情報
    
    var initialText: String!
    var commitHandler: CommitHandler!

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var tableViewBottom: NSLayoutConstraint!
    @IBOutlet private weak var textField: UITextField!
    
    private var keyboardManager: KeyboardManager!
    private var searchCompleter = MKLocalSearchCompleter()
    private var subtext = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCloseButtonOnNavigationBar()
        
        textField.delegate = self
        textField.text = initialText
        
        keyboardManager = KeyboardManager(delegate: self)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        searchCompleter.filterType = .locationsOnly
        searchCompleter.delegate = self
        searchCompleter.queryFragment = initialText!
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    @IBAction private func textFiledEditingChange() {
        searchCompleter.queryFragment = textField.text!
    }
}

extension LocationSearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchCompleter.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let completion = searchCompleter.results[indexPath.row]
        cell.textLabel?.text = completion.title
        cell.detailTextLabel?.text = completion.subtitle
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let completion = searchCompleter.results[indexPath.row]
        textField.text = completion.title
        subtext = completion.subtitle
    }
}

extension LocationSearchViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        commitHandler(textField.text!, subtext)
        Wireframe.dismiss(from: self)
        return true
    }
}

extension LocationSearchViewController: MKLocalSearchCompleterDelegate {
    
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        tableView.reloadData()
    }
}

extension LocationSearchViewController: KeyboardManagerDelegate {
    
    func keyboardManager(_ keyboardManager: KeyboardManager, willChange frame: CGRect) {
        tableViewBottom.constant = frame.height
    }
    
    func keyboardManager(_ keyboardManager: KeyboardManager, didChange frame: CGRect) {
        
    }
}
