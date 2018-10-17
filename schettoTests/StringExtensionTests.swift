//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import XCTest
@testable import schetto

class StringExtensionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // 文字数9(最大インデックス8)
    private let sample = "ABCDEFGHI"
    private let empty = ""
    
    func test_substring() {
        XCTAssertEqual(sample[2..<4], "CD")
        XCTAssertEqual(sample[2...4], "CDE")
        
        XCTAssertEqual(sample[6..<9], "GHI")
        XCTAssertEqual(sample[6...8], "GHI")
        
        XCTAssertEqual(sample[-1..<1], "A")
        XCTAssertEqual(sample[-1...1], "AB")
        
        XCTAssertEqual(sample[6..<20], "GHI")
        XCTAssertEqual(sample[6...20], "GHI")
        
        XCTAssertEqual(sample[-1..<20], "ABCDEFGHI")
        XCTAssertEqual(sample[-1...20], "ABCDEFGHI")
        
        XCTAssertEqual(sample[10..<11], "")
        XCTAssertEqual(sample[10...11], "")
        
        XCTAssertEqual(sample.substring(start: 4, end: 1), "")
        
        XCTAssertEqual(empty[1..<4], "")
        XCTAssertEqual(empty[1...4], "")
        
        XCTAssertEqual(sample[...4], "ABCDE")
        
        XCTAssertEqual(sample[..<4], "ABCD")
        
        XCTAssertEqual(sample[4...], "EFGHI")
    }
}
