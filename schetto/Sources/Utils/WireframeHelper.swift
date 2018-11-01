//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class WireframeHelper {
    
    func push(_ controller: UIViewController, from fromViewController: UIViewController) {
        fromViewController.navigationController?.pushViewController(controller, animated: true)
    }
    
    func pop(from fromViewController: UIViewController) {
        fromViewController.navigationController?.popViewController(animated: true)
    }
    
    func present(_ controller: UIViewController, from fromViewController: UIViewController, completion: (() -> ())? = nil) {
        fromViewController.present(controller, animated: true, completion: completion)
    }
    
    func dismiss(from fromViewController: UIViewController, completion: (() -> ())? = nil) {
        fromViewController.dismiss(animated: true, completion: completion)
    }
    
    func present(crossDisolve controller: UIViewController, from fromViewController: UIViewController, completion: (() -> ())? = nil) {
        controller.modalPresentationStyle = .overCurrentContext
        controller.modalTransitionStyle = .crossDissolve
        present(controller, from: fromViewController, completion: completion)
    }
    
    func withinNavigation(_ viewController: UIViewController) -> UINavigationController {
        return UINavigationController(rootViewController: viewController)
    }
}
