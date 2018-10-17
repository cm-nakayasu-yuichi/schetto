//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

extension String {
    
}

extension String {
    
    /// 自身から指定の文字列を削除した文字列を返す
    /// - Parameter string: 削除したい文字列
    /// - Returns: 削除された文字列
    func removed(_ string: String) -> String {
        return replacingOccurrences(of: string, with: "")
    }
    
    /// 指定した文字数分だけ後ろから削除したものを返す
    ///
    /// - Parameter length: 削除する文字数
    /// - Returns: 指定した文字数分だけ後ろから削除した文字数
//    func removedBackward(_ length: Int = 1) -> String {
//        return substring(start: 0, end: count - 1 - length)
//    }
}
