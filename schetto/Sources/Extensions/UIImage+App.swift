//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

extension UIImage {
    
    /// 画像ファイルパスから画像を初期化する
    /// - parameter path: 画像ファイルパス
    convenience init?(path: String) {
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
            return nil
        }
        self.init(data: data)
    }
    

}

extension UIImage {
    
    /// PNG形式のデータ
    var pngData: Data? {
        return UIImagePNGRepresentation(self)
    }
    
    /// JPEG形式のデータ
    var jpegData: Data? {
        return jpegData(compressionQuality: 0.96)
    }
    
    /// JPEG形式のデータ
    /// - Parameter compressionQuality: 圧縮品質
    /// - Returns: JPEG形式のデータ
    func jpegData(compressionQuality: CGFloat) -> Data? {
        return UIImageJPEGRepresentation(self, compressionQuality)
    }
    
    /// 指定したファイルパスに画像(PNG形式)を保存する
    /// - Parameter path: ファイルパス
    func write(to path: String) {
        try? pngData?.write(to: URL(fileURLWithPath: path), options: [.atomic])
    }
    
    
    /// 指定したファイルパスに画像(JPEG形式)を保存する
    /// - Parameters:
    ///   - path: ファイルパス
    ///   - compressionQuality: 圧縮品質
    func writeJpeg(to path: String, compressionQuality: CGFloat) {
        try? jpegData(compressionQuality: compressionQuality)?.write(to: URL(fileURLWithPath: path), options: [.atomic])
    }
}
