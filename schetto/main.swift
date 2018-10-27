//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

let argc = CommandLine.argc
let argv = UnsafeMutableRawPointer(CommandLine.unsafeArgv).bindMemory(
    to: UnsafeMutablePointer<Int8>.self,
    capacity: Int(CommandLine.argc)
)
let appDelegate = NSStringFromClass(AppDelegate.self)
let application = NSStringFromClass(Application.self)
let code = UIApplicationMain(argc, argv, application, appDelegate)

exit(code)
