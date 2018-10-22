//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

extension TimeZone {
    
    static let japan = TimeZone(identifier: "Asia/Tokyo")!
}

extension Locale {
    
    static let japan = Locale(identifier: "ja_JP")
    static let us = Locale(identifier: "en_US")
    static let korea = Locale(identifier: "ko_KR")
    static let usposix = Locale(identifier: "en_US_POSIX")
}

extension Date {
    
    static var currentTimezone: TimeZone = .current
    static var currentLocale: Locale = .current
    
    var calendar: Calendar {
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = Date.currentTimezone
        calendar.locale = Date.currentLocale
        return calendar
    }
}

extension Date {
    
    func fixed(year: Int? = nil, month: Int? = nil, day: Int? = nil, hour: Int? = nil, minute: Int? = nil, second: Int? = nil) -> Date {
        let calendar = self.calendar
        
        var comp = DateComponents()
        comp.year   = year   ?? calendar.component(.year,   from: self)
        comp.month  = month  ?? calendar.component(.month,  from: self)
        comp.day    = day    ?? calendar.component(.day,    from: self)
        comp.hour   = hour   ?? calendar.component(.hour,   from: self)
        comp.minute = minute ?? calendar.component(.minute, from: self)
        comp.second = second ?? calendar.component(.second, from: self)
        
        return calendar.date(from: comp)!
    }
    
    func added(year: Int? = nil, month: Int? = nil, day: Int? = nil, hour: Int? = nil, minute: Int? = nil, second: Int? = nil) -> Date {
        let calendar = self.calendar
        
        var comp = DateComponents()
        comp.year   = (year   ?? 0) + calendar.component(.year,   from: self)
        comp.month  = (month  ?? 0) + calendar.component(.month,  from: self)
        comp.day    = (day    ?? 0) + calendar.component(.day,    from: self)
        comp.hour   = (hour   ?? 0) + calendar.component(.hour,   from: self)
        comp.minute = (minute ?? 0) + calendar.component(.minute, from: self)
        comp.second = (second ?? 0) + calendar.component(.second, from: self)
        
        return calendar.date(from: comp)!
    }
}

extension Date {
    
    init(year: Int? = nil, month: Int? = nil, day: Int? = nil, hour: Int? = nil, minute: Int? = nil, second: Int? = nil) {
        self.init()
        if let value = year   { self.year   = value }
        if let value = month  { self.month  = value }
        if let value = day    { self.day    = value }
        if let value = hour   { self.hour   = value }
        if let value = minute { self.minute = value }
        if let value = second { self.second = value }
    }
    
    var year: Int {
        get {
            return calendar.component(.year, from: self)
        }
        set {
            setComponentValue(newValue, for: .year)
        }
    }
    
    var month: Int {
        get {
            return calendar.component(.month, from: self)
        }
        set {
            setComponentValue(newValue, for: .month)
        }
    }
    
    var day: Int {
        get {
            return calendar.component(.day, from: self)
        }
        set {
            setComponentValue(newValue, for: .day)
        }
    }
    
    var hour: Int {
        get {
            return calendar.component(.hour, from: self)
        }
        set {
            setComponentValue(newValue, for: .hour)
        }
    }
    
    var minute: Int {
        get {
            return calendar.component(.minute, from: self)
        }
        set {
            setComponentValue(newValue, for: .minute)
        }
    }
    
    var second: Int {
        get {
            return calendar.component(.second, from: self)
        }
        set {
            setComponentValue(newValue, for: .second)
        }
    }
    
    private mutating func setComponentValue(_ value: Int, for component: Calendar.Component) {
        var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self)
        components.setValue(value, for: component)
        if let date = calendar.date(from: components) {
            self = date
        }
    }
}

extension Date {
    
    enum SymbolType {
        case `default`
        case standalone
        case veryShort
        case short
        case shortStandalone
        case veryShortStandalone
        case custom(symbols: [String])
    }
    
    var weekIndex: Int {
        return calendar.component(.weekday, from: self) - 1
    }
    
    var weekName: String {
        let index = calendar.component(.weekday, from: self) - 1 // index値を 1〜7 から 0〜6 にしている
        return ["日", "月", "火", "水", "木", "金", "土"][index]
    }
    
    func weeks(_ type: SymbolType = .short, locale: Locale? = nil) -> [String] {
        let formatter = DateFormatter()
        formatter.locale = locale ?? calendar.locale
        
        switch type {
        case .`default`:           return formatter.weekdaySymbols
        case .standalone:          return formatter.standaloneWeekdaySymbols
        case .veryShort:           return formatter.veryShortWeekdaySymbols
        case .short:               return formatter.shortWeekdaySymbols
        case .shortStandalone:     return formatter.shortStandaloneWeekdaySymbols
        case .veryShortStandalone: return formatter.veryShortStandaloneWeekdaySymbols
        case let .custom(symbols): return symbols
        }
    }
    
    func week(_ type: SymbolType = .short, locale: Locale? = nil) -> String {
        return weeks(type, locale: locale)[weekIndex]
    }
}

extension Date {
    
    var monthIndex: Int {
        return calendar.component(.month, from: self) - 1
    }
    
    // SymbolType は 前項の「曜日の取得」で定義したもの
    func monthSymbols(_ type: SymbolType = .short, locale: Locale? = nil) -> [String] {
        let formatter = DateFormatter()
        formatter.locale = locale ?? calendar.locale
        
        switch type {
        case .`default`:           return formatter.monthSymbols
        case .standalone:          return formatter.standaloneMonthSymbols
        case .veryShort:           return formatter.veryShortMonthSymbols
        case .short:               return formatter.shortMonthSymbols
        case .shortStandalone:     return formatter.shortStandaloneMonthSymbols
        case .veryShortStandalone: return formatter.veryShortStandaloneMonthSymbols
        case let .custom(symbols): return symbols
        }
    }
    
    func monthSymbol(_ type: SymbolType = .short, locale: Locale? = nil) -> String {
        return monthSymbols(type, locale: locale)[monthIndex]
    }
}

extension Date {
    
    var oclock: Date {
        return fixed(minute: 0, second: 0)
    }
    
    var zeroclock: Date {
        return fixed(hour: 0, minute: 0, second: 0)
    }
}

extension Date {
    
    static var now: Date {
        return Date()
    }
    
    static var today: Date {
        return now.zeroclock
    }
    
    static func day(after days: Int) -> Date {
        return today.added(day: days)
    }
    
    static var yesterday: Date {
        return day(after: -1)
    }
    
    static var tomorrow: Date {
        return day(after: 1)
    }
    
    static var dayAfterTomorrow: Date {
        return day(after: 2)
    }
}

extension Date {
    
    var firstDayOfMonth: Date {
        return fixed(day: 1, hour: 0, minute: 0, second: 0)
    }
    
    var lastDayOfMonth: Date {
        return added(month: 1).fixed(day: 0, hour: 0, minute: 0, second: 0)
    }
}

extension Date {
    
    func isSameDay(_ otherDay: Date) -> Bool {
        return self.zeroclock == otherDay.zeroclock
    }
    
    func isSameDay(after days: Int) -> Bool {
        return isSameDay(Date.day(after: days))
    }
    
    var isToday: Bool {
        return isSameDay(Date.today)
    }
    
    var isYesterday: Bool {
        return isSameDay(Date.yesterday)
    }
    
    var isTomorrow: Bool {
        return isSameDay(Date.tomorrow)
    }
    
    var isDayAfterTomorrow: Bool {
        return isSameDay(Date.dayAfterTomorrow)
    }
}

extension Date {
    
    static let weekIndexOfSunday   = 0
    static let weekIndexOfSaturday = 6
    
    var isSunday: Bool {
        return weekIndex == Date.weekIndexOfSunday
    }
    
    var isSaturday: Bool {
        return weekIndex == Date.weekIndexOfSaturday
    }
    
    var isWeekend: Bool {
        return isSunday || isSaturday
    }
    
    var isUsualDay: Bool {
        return !isWeekend
    }
}

extension Date {
    
    func string(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.calendar = calendar
        formatter.timeZone = Date.currentTimezone
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter.string(from: self)
    }
}
