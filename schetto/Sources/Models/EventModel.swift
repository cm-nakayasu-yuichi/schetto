//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class EventModel {
    var id = ""
    var name = ""
    var start: Date? = nil
    var end: Date? = nil
    var all = false
    var summery = ""
    var location = ""
    var notify = 0 // notify分前に通知する
    var color: UIColor?
    var status = RecordStatus.draft
    var sticker: StickerModel?
    var assets = [AssetModel]()
}

extension EventModel {
    
    var startDateText: String {
        guard let date = start else { return "-" }
        return dateText(from: date)
    }
    
    var startTimeText: String {
        guard let date = start else { return "-" }
        return timeText(from: date)
    }
    
    var endDateText: String {
        guard let date = end else { return "-" }
        return dateText(from: date)
    }
    
    var endTimeText: String {
        guard let date = end else { return "-" }
        return timeText(from: date)
    }
    
    private func dateText(from date: Date, week: Bool = true) -> String {
        var ret = date.string(.custom(format: "yyyy年MM月dd日"))
        if week {
            ret += "(\(date.weak.symbol))"
        }
        return ret
    }
    
    private func timeText(from date: Date) -> String {
        return date.string(.custom(format: "HH:mm"))
    }
}
