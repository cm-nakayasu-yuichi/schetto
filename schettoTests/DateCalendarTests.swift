//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import XCTest
@testable import schetto

class DateCalendarTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_dates() {
        Date.datesMatrixForCalendar(year: 2018, month: 11, startWeek: .saturday).forEach { d in
            d.forEach { dd in
                print("WOW " + dd.todoLimitString)
            }
        }
    }
}
