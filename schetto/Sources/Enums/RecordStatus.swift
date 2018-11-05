//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

/// レコードの状態
enum RecordStatus: Int {
    /// 下書き
    case draft
    /// 表示中
    case published
    /// 削除済み
    case deleted
    /// テンプレート
    case template
}
