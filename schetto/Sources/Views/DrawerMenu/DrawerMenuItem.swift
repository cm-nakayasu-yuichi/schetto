//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

enum DrawerMenuItemSection {
    case calendars
    case news
    case mode
    case tool
    case setting
    case other
    
    var title: String {
        switch self {
        case .calendars: return "カレンダー"
        case .news: return "お知らせ"
        case .mode: return "表示"
        case .tool: return "ツール"
        case .setting: return "設定"
        case .other: return "その他"
        }
    }
    
    var items: [DrawerMenuItem] {
        switch self {
        case .calendars: return [.manageCalendar] // variability.
        case .news: return [.news]
        case .mode: return [.yearly, .monthly, .weekly, .daily]
        case .tool: return [.search, .dialy]
        case .setting: return [.calendarSetting, .appSetting]
        case .other: return [.purchase, .help, .terms, .privacy]
        }
    }
    
    static let sections: [DrawerMenuItemSection] = [
        .news,
        .calendars,
        .mode,
        .tool,
        .setting,
        .other,
    ]
}

enum DrawerMenuItem {
    case manageCalendar
    case news
    case yearly
    case monthly
    case weekly
    case daily
    case search
    case dialy
    case calendarSetting
    case appSetting
    case purchase
    case help
    case terms
    case privacy
    
    var title: String {
        switch self {
        case .manageCalendar: return "カレンダー管理"
        case .news: return "お知らせ"
        case .yearly: return "年表示"
        case .monthly: return "月表示"
        case .weekly: return "週表示"
        case .daily: return "日表示"
        case .search: return "検索"
        case .dialy: return "日記"
        case .calendarSetting: return "カレンダー設定"
        case .appSetting: return "アプリ設定"
        case .purchase: return "アイテム購入"
        case .help: return "ヘルプ"
        case .terms: return "利用規約"
        case .privacy: return "プライバシーポリシー"
        }
    }
}
