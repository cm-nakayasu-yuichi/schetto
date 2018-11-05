//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class Wireframe {
    
    static func showMain(from fromViewController: UIViewController) {
        let viewController = builder.main()
        helper.present(crossDisolve: viewController, from: fromViewController)
    }
    
    static func showEventEdit(from fromViewController: UIViewController) {
        let viewController = builder.eventEdit()
        helper.present(crossDisolve: viewController, from: fromViewController)
    }
    
    static func showDrawerMenu(from fromViewController: UIViewController) {
        let viewController = builder.drawerMenu()
        let behavior = DialogLeftDrawBehavior(width: .screenWidth * 0.75)
        Dialog.show(viewController, from: fromViewController, behavior: behavior)
    }
    
    static func showLaunch(from fromViewController: UIViewController) {
        let viewController = builder.launch()
        helper.present(crossDisolve: viewController, from: fromViewController)
    }
    
    static func showTutorial(from fromViewController: UIViewController) {
        let viewController = builder.tutorial()
        helper.present(crossDisolve: viewController, from: fromViewController)
    }
    
    static func showTerms(from fromViewController: UIViewController) {
        let viewController = builder.terms()
        helper.present(crossDisolve: helper.withinNavigation(viewController), from: fromViewController)
    }
    
    static func showDesignFontSetting(from fromViewController: UIViewController) {
        let viewController = builder.designFontSetting()
        let behavior = DialogRiseupBehavior()
        Dialog.show(viewController, from: fromViewController, behavior: behavior)
    }
    
    static func showTodoList(from fromViewController: UIViewController) {
        let viewController = builder.todoList()
        helper.present(crossDisolve: viewController, from: fromViewController)
    }
    
    static func showTodoEdit(from fromViewController: UIViewController) {
        let viewController = builder.todoEdit()
        helper.present(crossDisolve: viewController, from: fromViewController)
    }
    
    static func showTodoDetail(from fromViewController: UIViewController) {
        let viewController = builder.todoDetail()
        helper.present(crossDisolve: viewController, from: fromViewController)
    }
    
    static func showWeb(from fromViewController: UIViewController) {
        let viewController = builder.web()
        helper.present(viewController, from: fromViewController)
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
    
    static func showConfirmDeleteEvent(from fromViewController: UIViewController, didDecide: @escaping () -> ()) {
        alertHelper.alertDeleteCancel(
            from: fromViewController,
            title: "確認",
            message: "このイベントを削除しますか",
            didDecide: didDecide
        )
    }
    
    private static var builder: Builder { return Builder() }
    private static var helper: WireframeHelper { return WireframeHelper() }
    private static var alertHelper: AlertHelper { return AlertHelper() }
}
