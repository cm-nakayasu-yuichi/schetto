//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

extension String {
    
    /// パスコンポーネント追加
    /// - Parameter component: 追加するコンポーネント
    /// - Returns: 追加されたパス文字列
    func path(_ component: String) -> String {
        return (self as NSString).appendingPathComponent(component)
    }
    
    /// 拡張子を取り除いた文字列を返す
    /// - Returns: 拡張子を取り除いたパス文字列
    var withoutExtension: String {
        return (self as NSString).deletingPathExtension
    }
    
    /// 拡張子を返す
    var `extension`: String {
        let ext = (self as NSString).pathExtension
        return ext.isEmpty ? "" : ".\(ext)"
    }
    
    /// ドットなしの拡張子を返す
    var extensionWithoutDot: String {
        let ext = (self as NSString).pathExtension
        return ext.isEmpty ? "" : "\(ext)"
    }
    
    /// ディレクトリパス
    var directoryPath: String {
        if self == "/" { return "" }
        return (self as NSString).deletingLastPathComponent
    }
    
    /// ファイルURL
    var fileURL: URL {
        return URL(fileURLWithPath: self)
    }
    
    /// ファイルから取得した画像
    var fileImage: UIImage? {
        guard let data = try? Data(contentsOf: fileURL) else {
            return nil
        }
        return UIImage(data: data)
    }
}
