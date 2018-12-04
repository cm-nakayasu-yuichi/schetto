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
    
    func eventAdapterDidTapEditTitle(_ adapter: EventAdapter) {
        
    }
    
    func eventAdapterDidTapEditStartDate(_ adapter: EventAdapter) {
        
    }
    
    func eventAdapterDidTapEditEndDate(_ adapter: EventAdapter) {
    
    }
    
    func eventAdapter(_ adapter: EventAdapter, didTapAllDay value: Bool) {
        
    }
    
    func eventAdapterDidTapEditSummery(_ adapter: EventAdapter) {
        
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
