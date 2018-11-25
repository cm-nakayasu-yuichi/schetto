//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import XCTest
@testable import schetto

class DateTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // 2014/12/06 17:30:15 (土)
    private let sample = Date(timeIntervalSince1970: 1417854615)
    
    func test_init() {
        let date = Date(year: 2014, month: 12, day: 06, hour: 17, minute: 30, second: 15)
        XCTAssertEqual(date, sample)
    }
    
    func test_set() {
        var date = sample
        date.year = 2016
        XCTAssertEqual(date.string(), "2016/12/06 17:30:15")
        date.month = 1
        XCTAssertEqual(date.string(), "2016/01/06 17:30:15")
        date.day = 1
        XCTAssertEqual(date.string(), "2016/01/01 17:30:15")
        date.hour = 1
        XCTAssertEqual(date.string(), "2016/01/01 01:30:15")
        date.minute = 1
        XCTAssertEqual(date.string(), "2016/01/01 01:01:15")
        date.second = 1
        XCTAssertEqual(date.string(), "2016/01/01 01:01:01")
        
        date.month = 0
        XCTAssertEqual(date.string(), "2015/12/01 01:01:01")
        date.month = 13
        XCTAssertEqual(date.string(), "2016/01/01 01:01:01")
    }
    
    func test_add() {
        var date = sample
        date = date.added()
        XCTAssertEqual(date.string(), "2014/12/06 17:30:15")
        date = date.added(year: 1)
        XCTAssertEqual(date.string(), "2015/12/06 17:30:15")
        date = date.added(month: 1)
        XCTAssertEqual(date.string(), "2016/01/06 17:30:15")
        date = date.added(day: 1)
        XCTAssertEqual(date.string(), "2016/01/07 17:30:15")
        date = date.added(hour: 1)
        XCTAssertEqual(date.string(), "2016/01/07 18:30:15")
        date = date.added(minute: 1)
        XCTAssertEqual(date.string(), "2016/01/07 18:31:15")
        date = date.added(second: 1)
        XCTAssertEqual(date.string(), "2016/01/07 18:31:16")
        
        date = date.added(month: -1)
        XCTAssertEqual(date.string(), "2015/12/07 18:31:16")
        date = date.added(month: 13)
        XCTAssertEqual(date.string(), "2017/01/07 18:31:16")
    }
    
    func test_fixed() {
        var date = sample
        date = date.fixed()
        XCTAssertEqual(date.string(), "2014/12/06 17:30:15")
        date = date.fixed(year: 2015)
        XCTAssertEqual(date.string(), "2015/12/06 17:30:15")
        date = date.fixed(month: 4)
        XCTAssertEqual(date.string(), "2015/04/06 17:30:15")
        date = date.fixed(day: 1)
        XCTAssertEqual(date.string(), "2015/04/01 17:30:15")
        date = date.fixed(hour: 1)
        XCTAssertEqual(date.string(), "2015/04/01 01:30:15")
        date = date.fixed(minute: 1)
        XCTAssertEqual(date.string(), "2015/04/01 01:01:15")
        date = date.fixed(second: 1)
        XCTAssertEqual(date.string(), "2015/04/01 01:01:01")
    }
    
    func test_week() {
        XCTAssertEqual(sample.weekIndex, 6)
        XCTAssertEqual(sample.weak.symbol(), "Sat")
        XCTAssertEqual(sample.weak.symbol(locale: .jp), "土")
        XCTAssertEqual(Date.Week.symbols(.default, locale: .jp), ["日曜日", "月曜日", "火曜日", "水曜日", "木曜日", "金曜日", "土曜日"])
        XCTAssertEqual(Date.Week.symbols(.default), ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"])
        XCTAssertEqual(Date.Week.symbols(.shortStandalone, locale: .jp), ["日", "月", "火", "水", "木", "金", "土"])
    }
    
    func test_month() {
        XCTAssertEqual(sample.monthIndex, 11)
        XCTAssertEqual(sample.monthSymbol(), "Dec")
        XCTAssertEqual(sample.monthSymbol(locale: .jp), "12月")
        XCTAssertEqual(sample.monthSymbols(.default, locale: .jp), ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"])
        XCTAssertEqual(sample.monthSymbols(.default), ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"])
        XCTAssertEqual(sample.monthSymbols(.shortStandalone, locale: .jp), ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"])
    }
    
    func test_oclock() {
        XCTAssertEqual(sample.oclock.string(), "2014/12/06 17:00:00")
        XCTAssertEqual(sample.zeroclock.string(), "2014/12/06 00:00:00")
        XCTAssertEqual(sample.firstOfDay.string(), "2014/12/06 00:00:00")
        XCTAssertEqual(sample.lastOfDay.string(), "2014/12/06 23:59:59")
        XCTAssertEqual(sample.firstDayOfMonth.string(), "2014/12/01 00:00:00")
        XCTAssertEqual(sample.lastDayOfMonth.string(), "2014/12/31 00:00:00")
        XCTAssertEqual(sample.lastDayOfMonth.lastOfDay.string(), "2014/12/31 23:59:59")
    }
    
    func test_isSameDay() {
        // 2014/12/06 12:34:56 (土)
        let other = Date(timeIntervalSince1970: 1417836896)
        XCTAssertEqual(other.string(), "2014/12/06 12:34:56")
        
        XCTAssertNotEqual(sample, other)
        XCTAssertTrue(sample.isSameDay(other))
    }
    
    func test_convert() {
        XCTAssertEqual(sample.string(.hyphenedYMD), "2014-12-06")
        XCTAssertEqual(sample.string(.japaneseHM), "17時30分")
        
        XCTAssertEqual(Date.date(from: "2014年12月06日 17時30分15秒", format: .japaneseYMDHMS), sample)
        XCTAssertEqual(Date.date(from: "2014/12/06 17:30:15", format: .slashedYMDHMS), sample)
        XCTAssertNotEqual(Date.date(from: "2014/12/06 17:30:14", format: .slashedYMDHMS), sample)
        
        XCTAssertNil(Date.date(from: "dummy", format: .slashedYMDHMS))
    }
}
