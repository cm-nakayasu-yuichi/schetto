//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class EventViewController: UIViewController {

    var presenter: EventPresenterProtocol!
    var event: EventModel?
    
    private var adapter: EventAdapter!
    private var editEvent: EventModel!
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var toolbar: UIView!
    @IBOutlet private weak var deleteButton: UIBarButtonItem!
    @IBOutlet private weak var templateButton: UIBarButtonItem!
    @IBOutlet private weak var copyButton: UIBarButtonItem!
    @IBOutlet private weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "予定"
        setupCloseButtonOnNavigationBar()
        toolbar.dropShadowTop()
        presenter.fetchEditableEvent(from: event)
    }
    
    @IBAction private func didTapDeleteButton() {
        // Nop.
    }
    
    @IBAction private func didTapTemplateButton() {
        // Nop.
    }
    
    @IBAction private func didTapCopyButton() {
        // Nop.
    }
    
    @IBAction private func didTapSaveButton() {
        // Nop.
    }
}

extension EventViewController: EventViewProtocol {
    
    func fetchedEditable(event: EventModel) {
        editEvent = event
        adapter = EventAdapter(tableView, event: editEvent, delegate: self)
    }
    
    func registered() {
        
    }
    
    func removed() {
        
    }
}

extension EventViewController: EventAdapterDelegate {
    
    func eventAdapterDidTapEditName(_ adapter: EventAdapter) {
        let options = TextViewControllerOptions(
            title: "予定名",
            placeholder: "予定の名前を入れてください",
            text: editEvent.name,
            multiLine: false
        )
        Wireframe.showText(from: self, options: options) { text in
            self.editEvent.name = text
            self.tableView.reloadData()
        }
    }
    
    func eventAdapterDidTapEditStartDate(_ adapter: EventAdapter) {
        Wireframe.showDatePicker(from: self, dateTime: editEvent.start!, title: "予定の開始") { date in
            self.editEvent.start = date
            self.tableView.reloadData()
        }
    }
    
    func eventAdapterDidTapEditEndDate(_ adapter: EventAdapter) {
        Wireframe.showDatePicker(from: self, dateTime: editEvent.start!, title: "予定の終了") { date in
            self.editEvent.end = date
            self.tableView.reloadData()
        }
    }
    
    func eventAdapterDidTapColor(_ adapter: EventAdapter) {
        
    }
    
    func eventAdapterDidTapSticker(_ adapter: EventAdapter) {
        
    }
    
    func eventAdapter(_ adapter: EventAdapter, didTapAllDay value: Bool) {
        
    }
    
    func eventAdapterDidTapEditSummery(_ adapter: EventAdapter) {
        let options = TextViewControllerOptions(
            title: "予定の概要・メモ",
            placeholder: "予定の概要・メモを書いてください",
            text: editEvent.summery,
            multiLine: false
        )
        Wireframe.showText(from: self, options: options) { text in
            self.editEvent.summery = text
            self.tableView.reloadData()
        }
    }
    
    func eventAdapterDidTapEditLocation(_ adapter: EventAdapter) {
        
    }
    
    func eventAdapterDidSelectNotify(_ adapter: EventAdapter) {
        
    }
    
    func eventAdapter(_ adapter: EventAdapter, didTapAsset asset: AssetModel) {
        
    }
    
    func eventAdapterDidTapAddAsset(_ adapter: EventAdapter) {
        
    }
    
    func eventAdapter(_ adapter: EventAdapter, didTapDeleteAsset asset: AssetModel) {
        
    }
}
