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
    
    func test_percentage() {
        XCTAssertEqual((-0.01).f.percentage, 0.0)
        XCTAssertEqual(0.f.percentage, 0.0)
        XCTAssertEqual((0.01).f.percentage, 0.01)
        XCTAssertEqual((0.99).f.percentage, 0.99)
        XCTAssertEqual((1.00).f.percentage, 1.00)
        XCTAssertEqual((1.01).f.percentage, 1.00)
        XCTAssertEqual(2.f.percentage, 1.00)
    }
    
    func test_percentageString() {
        let a = (0.123456).f.percentageString()
        XCTAssertEqual(a, "12.35%")
        
        let b = (0.123456).f.percentageString(place: 1)
        XCTAssertEqual(b, "12.3%")
        
        let c = (0.123456).f.percentageString(place: 0)
        XCTAssertEqual(c, "12%")
        
        let d = (0.123456).f.percentageString(unit: "パーセント")
        XCTAssertEqual(d, "12.35パーセント")
        
        let e = (0.11111).f.percentageString(rule: .down)
        XCTAssertEqual(e, "11.11%")
        
        let f = (0.11111).f.percentageString(rule: .up)
        XCTAssertEqual(f, "11.12%")
        
        let g = (0.123456).f.percentageString(place: 3, rule: .down, unit: "")
        XCTAssertEqual(g, "12.345")
        
        let h = 123.f.percentageString()
        XCTAssertEqual(h, "100.00%")
        
        let i = (0.123).f.percentageString(place: 4)
        XCTAssertEqual(i, "12.3000%")
    }
}
