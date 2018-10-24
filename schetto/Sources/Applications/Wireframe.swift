//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class Wireframe {
    
    static func showEventEdit(from fromViewController: UIViewController) {
        let viewController = builder.eventEdit()
        helper.present(crossDisolve: viewController, from: fromViewController)
    }
    
    static func showTest(from fromViewController: UIViewController) {
        let viewController = builder.test()
        helper.present(crossDisolve: viewController, from: fromViewController)
    }
    
    static func pop(from fromViewController: UIViewController) {
        helper.pop(from: fromViewController)
    }
    
    static func dismiss(from fromViewController: UIViewController, completion: (() -> ())? = nil) {
        helper.dismiss(from: fromViewController, completion: completion)
    }
    
    private static var builder: Builder { return Builder() }
    private static var helper: WireframeHelper { return WireframeHelper() }
    private static var alertHelper: AlertHelper { return AlertHelper() }
}
