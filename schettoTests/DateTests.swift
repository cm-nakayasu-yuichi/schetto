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
        XCTAssertEqual(date.string(.default), "2016/12/06 17:30:15")
        date.month = 1
        XCTAssertEqual(date.string(.default), "2016/01/06 17:30:15")
        date.day = 1
        XCTAssertEqual(date.string(.default), "2016/01/01 17:30:15")
        date.hour = 1
        XCTAssertEqual(date.string(.default), "2016/01/01 01:30:15")
        date.minute = 1
        XCTAssertEqual(date.string(.default), "2016/01/01 01:01:15")
        date.second = 1
        XCTAssertEqual(date.string(.default), "2016/01/01 01:01:01")
        
        date.month = 0
        XCTAssertEqual(date.string(.default), "2015/12/01 01:01:01")
        date.month = 13
        XCTAssertEqual(date.string(.default), "2016/01/01 01:01:01")
    }
    
    func test_add() {
        var date = sample
        date = date.added()
        XCTAssertEqual(date.string(.default), "2014/12/06 17:30:15")
        date = date.added(year: 1)
        XCTAssertEqual(date.string(.default), "2015/12/06 17:30:15")
        date = date.added(month: 1)
        XCTAssertEqual(date.string(.default), "2016/01/06 17:30:15")
        date = date.added(day: 1)
        XCTAssertEqual(date.string(.default), "2016/01/07 17:30:15")
        date = date.added(hour: 1)
        XCTAssertEqual(date.string(.default), "2016/01/07 18:30:15")
        date = date.added(minute: 1)
        XCTAssertEqual(date.string(.default), "2016/01/07 18:31:15")
        date = date.added(second: 1)
        XCTAssertEqual(date.string(.default), "2016/01/07 18:31:16")
        
        date = date.added(month: -1)
        XCTAssertEqual(date.string(.default), "2015/12/07 18:31:16")
        date = date.added(month: 13)
        XCTAssertEqual(date.string(.default), "2017/01/07 18:31:16")
    }
    
    func test_fixed() {
        var date = sample
        date = date.fixed()
        XCTAssertEqual(date.string(.default), "2014/12/06 17:30:15")
        date = date.fixed(year: 2015)
        XCTAssertEqual(date.string(.default), "2015/12/06 17:30:15")
        date = date.fixed(month: 4)
        XCTAssertEqual(date.string(.default), "2015/04/06 17:30:15")
        date = date.fixed(day: 1)
        XCTAssertEqual(date.string(.default), "2015/04/01 17:30:15")
        date = date.fixed(hour: 1)
        XCTAssertEqual(date.string(.default), "2015/04/01 01:30:15")
        date = date.fixed(minute: 1)
        XCTAssertEqual(date.string(.default), "2015/04/01 01:01:15")
        date = date.fixed(second: 1)
        XCTAssertEqual(date.string(.default), "2015/04/01 01:01:01")
    }
    
    func test_week() {
        XCTAssertEqual(sample.weekIndex, 6)
        print("WOW \(sample.week(locale: .japan))")
    }
    
    func test_init2() {
        print("WOW \(sample.string(.default))")
    }
}
