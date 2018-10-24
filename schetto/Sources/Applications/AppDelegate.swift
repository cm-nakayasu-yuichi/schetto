//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    private(set) var lifeCycle: ApplicationLifeCycle = .none
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        lifeCycle = .willResignActive
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        lifeCycle = .didEnterBackground
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        lifeCycle = .willEnterForeground
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        lifeCycle = .didBecomeActive
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        lifeCycle = .willTerminate
    }
}

extension UIApplication {
    
    var lifeCycle: ApplicationLifeCycle {
        return (UIApplication.shared.delegate as? AppDelegate)?.lifeCycle ?? .none
    }
}
