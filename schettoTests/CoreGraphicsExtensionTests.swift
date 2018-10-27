//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import XCTest
@testable import schetto

class CoreGraphicsExtensionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_CGSize_center() {
        let parent = CGSize(100, 100)
        let child = CGSize(40, 30)
        
        XCTAssertEqual(child.center(of: parent), CGRect(30, 35, 40, 30))
    }
}
