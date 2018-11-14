//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

extension Date {
    
    var todoLimitString: String { // TODO: ロケール対応
        var ret = string(.japaneseYMD)
        ret += "(\(week(.short, locale: .jp))) " // TODO: ロケール対応
        ret += string(.colonedHM)
        ret += "まで"
        return ret
    }
}
