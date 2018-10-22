//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

extension Date {
    
    enum Format: String {
        case `default` = "yyyy/MM/dd HH:mm:ss"
        case hyphened = "yyyy-MM-dd HH:mm:ss"
    }
    
    func string(_ format: Format) -> String {
        return string(format: format.rawValue)
    }
}
