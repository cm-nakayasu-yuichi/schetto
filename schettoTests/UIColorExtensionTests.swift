//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import XCTest
@testable import schetto

class UIColorExtensionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_rgb() {
        let color = UIColor(rgb: 0x123456)
        XCTAssertEqual(color.rgbString, "123456")
    }
    
    func test_rgba() {
        let color = UIColor(rgba: 0x12345678)
        XCTAssertEqual(color.rgbaString, "12345678")
    }
    
    func test_component() {
        let color = UIColor(red: 0.3765733507, green: 0.2125651042, blue: 0.7119954427, alpha: 1)
        XCTAssertEqual(color.redComponent, 0.3765733507)
        XCTAssertEqual(color.greenComponent, 0.2125651042)
        XCTAssertEqual(color.blueComponent, 0.7119954427)
        XCTAssertEqual(color.alphaComponent, 1)
    }
    
    func test_withComponent() {
        let color = UIColor(red: 0.3765733507, green: 0.2125651042, blue: 0.7119954427, alpha: 1)
        XCTAssertEqual(color.withRedComponent(0.5), UIColor(red: 0.5, green: 0.2125651042, blue: 0.7119954427, alpha: 1))
        XCTAssertEqual(color.withGreenComponent(0.5), UIColor(red: 0.3765733507, green: 0.5, blue: 0.7119954427, alpha: 1))
        XCTAssertEqual(color.withBlueComponent(0.5), UIColor(red: 0.3765733507, green: 0.2125651042, blue: 0.5, alpha: 1))
        XCTAssertEqual(color.withAlphaComponent(0.5), UIColor(red: 0.3765733507, green: 0.2125651042, blue: 0.7119954427, alpha: 0.5))
    }
}
