//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class DesignFontSettingViewController: UIViewController {

    var presenter: DesignFontSettingPresenterProtocol!
    
    private var adapter: DesignFontSettingAdapter!
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var closeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        adapter = DesignFontSettingAdapter(tableView, delegate: self)
    }
    
    @IBAction private func didTapCloseButton() {
        // NOP.
    }
}

extension DesignFontSettingViewController: DesignFontSettingViewProtocol {

}

extension DesignFontSettingViewController: DesignFontSettingAdapterDelegate {
    
    func numberOfItems(in adapter: DesignFontSettingAdapter) -> Int {
        return 20
//        return presenter.items.count
    }
    
    func designFontSettingAdapter(_ adapter: DesignFontSettingAdapter, itemAt index: Int) -> Any {
        return "hoge"
//        return presenter.items[index]
    }
    
    func designFontSettingAdapter(_ adapter: DesignFontSettingAdapter, didSelectAt index: Int) {
        // NOP.
    }
}
