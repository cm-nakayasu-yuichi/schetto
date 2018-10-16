//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import XCTest
@testable import schetto

class NumberExtensionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_formatted() {
        XCTAssertEqual(123.formatted, "123")
        XCTAssertEqual(1234.formatted, "1,234")
        XCTAssertEqual(12345.formatted, "12,345")
        XCTAssertEqual((-123).formatted, "-123")
        XCTAssertEqual((-1234).formatted, "-1,234")
        XCTAssertEqual((-12345).formatted, "-12,345")
    }
    
    func test_bool_reverse() {
        let a = true
        XCTAssertFalse(a.reversed)
        XCTAssertTrue(a, "元の値は変更されないこと")
        
        var b = true
        XCTAssertFalse(b.reverse())
        XCTAssertFalse(b, "元の値は変更されること")
    }
}
