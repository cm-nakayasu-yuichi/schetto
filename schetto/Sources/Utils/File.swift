//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

class File {
}

extension File {
    
    /// ドキュメントディレクトリパス
    static var documentDirectoryPath: String {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
    }
    
    /// 指定したディレクトリパス内のファイル名をすべて取得する
    /// - Parameter path: ディレクトリパス文字列
    /// - Returns: ファイル名の配列
    class func fileNames(in path: String) -> [String] {
        do {
            return try FileManager.default.contentsOfDirectory(atPath: path).sorted()
        } catch let error {
            print("File: failed get file names in \(path). \(error.localizedDescription)")
        }
        return []
    }
    
    /// 指定したファイルを削除する
    /// - Parameter path: ファイルパス
    class func delete(at path: String) {
        if FileManager.default.fileExists(atPath: path) {
            do {
                try FileManager.default.removeItem(atPath: path)
            } catch let error {
                print("File: failed delete at \(path). \(error.localizedDescription)")
            }
        }
    }
    
    /// 指定したパスにファイルが存在しない場合に空のテキストファイルを作成する
    /// - Parameters:
    ///   - path: ファイルパス
    ///   - content: テキストファイルの内容
    /// - Returns: 作成を完了した場合のみ true を返す
    class func makeTextFileIfNeeded(to path: String, content: String = "") -> Bool {
        if !FileManager.default.fileExists(atPath: path) {
            do {
                try content.write(to: URL(fileURLWithPath: path), atomically: true, encoding: .utf8)
                return true
            } catch let error {
                print("File: failed make text file to \(path). \(error.localizedDescription)")
            }
        }
        return false
    }
    
    /// 指定したパスにディレクトリが存在しない場合にディレクトリを作成する
    /// - Parameter path: ディレクトリパス
    /// - Returns: 作成を完了した場合のみ true を返す
    class func makeDirectoryIfNeeded(to path: String) -> Bool {
        if !FileManager.default.fileExists(atPath: path) {
            do {
                try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
                return true
            } catch(let error) {
                print("File: failed make directory to \(path). \(error.localizedDescription)")
            }
        }
        return false
    }
}
