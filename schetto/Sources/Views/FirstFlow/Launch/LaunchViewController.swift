//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class LaunchViewController: UIViewController {
    
    var presenter: LaunchPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.launch()
    }
}

extension LaunchViewController: LaunchViewProtocol {

    func showMain() {
        print(2)
    }
    
    func showTerms() {
        print(1)
    }
    
    func showTutorial() {
        
    }
}
