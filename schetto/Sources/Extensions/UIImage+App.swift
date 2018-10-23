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
    
    /// JPEG形式のデータ
    /// - Parameter compressionQuality: 圧縮品質
    /// - Returns: JPEG形式のデータ
    func jpegData(compressionQuality: CGFloat) -> Data? {
        return UIImageJPEGRepresentation(self, compressionQuality)
    }
    
    /// JPEG形式のデータ
    var jpegData: Data? {
        return jpegData(compressionQuality: 0.96)
    }
    
    /// PNG形式のデータ
    var pngData: Data? {
        return UIImagePNGRepresentation(self)
    }
    
    /// 指定したファイルパスに画像(JPEG形式)を保存する
    /// - Parameters:
    ///   - path: ファイルパス
    ///   - compressionQuality: 圧縮品質
    func writeJpeg(to path: String, compressionQuality: CGFloat) {
        try? jpegData(compressionQuality: compressionQuality)?.write(to: URL(fileURLWithPath: path), options: [.atomic])
    }
    
    /// 指定したファイルパスに画像(PNG形式)を保存する
    /// - Parameter path: ファイルパス
    func writePng(to path: String) {
        try? pngData?.write(to: URL(fileURLWithPath: path), options: [.atomic])
    }
}

extension UIImage {
    
    /// グラフィックコンテキストの描画処理をラッピングして画像を生成する
    /// - Parameters:
    ///   - size: サイズ
    ///   - processBlock: 描画処理
    /// - Returns: 生成した画像
    class func imageFromContext(_ size: CGSize, _ processBlock: (CGContext)->Void) -> UIImage {
        UIGraphicsBeginImageContext(size)
        processBlock(UIGraphicsGetCurrentContext()!)
        let ret = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return ret!
    }
}

extension UIImage {
    
    /// 指定のサイズに拡大縮小した画像を生成して返す
    /// - Parameter size: サイズ
    /// - Returns: 拡大縮小した画像
    func scaled(to size: CGSize) -> UIImage {
        return UIImage.imageFromContext(size) { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
    
    /// 指定の領域で切り取った画像を生成して返す
    /// - Parameter rect: 切り取る領域
    /// - Returns: 切り取った画像
    func cropped(to rect: CGRect) -> UIImage {
        guard let ref = cgImage?.cropping(to: rect) else {
            return UIImage.imageFromContext(rect.size) { _ in } // 空の画像
        }
        return UIImage(cgImage: ref, scale: scale, orientation: imageOrientation)
    }
    
    /// 画像のサイズは固定したまま指定のサイズへと変更した画像を生成して返す
    /// - Parameter size: 指定のサイズ
    /// - Returns: 指定のサイズへと変更した画像
    func fixed(size: CGSize) -> UIImage {
        return UIImage.imageFromContext(size) { _ in
            let rect = CGRect(
                (size.width - self.size.width) / 2,
                (size.height - self.size.height) / 2,
                self.size.width,
                self.size.height
            )
            draw(in: rect)
        }
    }
    
    /// 画像の形にマスクした画像を生成して返す
    /// - Parameter color: 塗りつぶす色
    /// - Returns: 画像の形にマスクした画像
    func masked(color: UIColor) -> UIImage? {
        let rect = CGRect(origin: .zero, size: size)
        let bitmap = CGImageAlphaInfo.premultipliedLast.rawValue
        let space = CGColorSpaceCreateDeviceRGB()
        
        guard let context = CGContext(
            data: nil,
            width: Int(rect.width),
            height: Int(rect.height),
            bitsPerComponent: 8,
            bytesPerRow: 0,
            space: space,
            bitmapInfo: bitmap
        ) else {
            return UIImage.imageFromContext(size) { _ in } // 空の画像
        }
        
        context.setFillColor(color.cgColor)
        context.fill(rect)
        
        let imageRef = context.makeImage()!
        context.clear(rect)
        context.clip(to: rect, mask: cgImage!)
        context.draw(imageRef, in: rect)
        return UIImage(cgImage: context.makeImage()!)
    }
}

extension UIImage {
    
    /// 文字を画像化して返す
    /// - Parameters:
    ///   - text: 文字
    ///   - color: 文字色
    ///   - font: フォント
    /// - Returns: 画像化した文字
    class func text(_ text: String, color: UIColor = .black, font: UIFont = UIFont.systemFont(ofSize: 32)) -> UIImage? {
        let ns = (text as NSString)
        let attributes: [NSAttributedStringKey : Any] = [
            .font: font,
            .foregroundColor: color,
        ]
        let size = ns.size(withAttributes: attributes)
        return UIImage.imageFromContext(size) { _ in
            ns.draw(at: .zero, withAttributes: attributes)
        }
    }
}
