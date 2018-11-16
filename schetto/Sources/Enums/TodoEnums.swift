//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

/// TODOの並び順
enum TodoSortType: Int {
    case limit
    case priority
    
    var title: String {
        switch self {
        case .limit: return "期限が近い順"
        case .priority: return "優先順位が高い順"
        }
    }
    
    static let types: [TodoSortType] = [
        .limit, .priority
    ]
}

/// TODOの優先度
enum TodoPriority: Int {
    case veryLow
    case low
    case normal
    case high
    case required
    
    static let sortItems: [TodoPriority] = [
        .required, .high, .normal, .low, .veryLow
    ]
    
    var title: String {
        switch self {
        case .veryLow: return "やらなくてもいい"
        case .low: return "できればやる"
        case .normal: return "やる"
        case .high: return "やらなければならない"
        case .required: return "必ずやる"
        }
    }
}

/// TODOの期限の種別
enum TodoLimitType: Int {
    case todayRequired
    case today
    case tomorrow
    case dayAfterTomorrow
    case thisWeek
    case thisMonth
    case someday
    
    static let sortItems: [TodoLimitType] = [
        .todayRequired, .today, .tomorrow, .dayAfterTomorrow, .thisWeek, .thisMonth, .someday
    ]
    
    var title: String {
        switch self {
        case .todayRequired: return "今日中に必ずやる"
        case .today: return "今日中にやる"
        case .tomorrow: return "明日までにやる"
        case .dayAfterTomorrow: return "明後日までにやること"
        case .thisWeek: return "今週やること"
        case .thisMonth: return "今月やること"
        case .someday: return "いつかやる"
        }
    }
}
