//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

extension File {
    
    /// データ用ディレクトリ
    static var dataDirectory: File {
        return documentDirectory + "data"
    }
    
    /// カレンダー用ディレクトリ
    static var calandarsDirectory: File {
        return documentDirectory + "calendars"
    }
    
    /// 各カレンダー用ディレクトリ
    static func calandarDirectory(id: String) -> File {
        return calandarsDirectory + "calendar-\(id)"
    }
    
    /// テスト用ディレクトリ
    static var testDirectory: File {
        return documentDirectory + "test"
    }
}

extension File {
    
    /// 各カレンダー設定ファイル
    static func calandarSetting(id: String) -> File {
        let ret = calandarDirectory(id: id) + "setting.json"
        try? ret.makeEmptyTextFile()
        return ret
    }
}
