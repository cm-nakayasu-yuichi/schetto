//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class TestViewController: UIViewController {
    
    @IBOutlet private weak var swi: UISwitch!
    @IBOutlet private weak var seg: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCloseButtonOnNavigationBar()
        
        swi.applyAppearance()
        seg.applyAppearance()
    }
}
