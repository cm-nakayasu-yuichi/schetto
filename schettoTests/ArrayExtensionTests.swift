//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import XCTest
@testable import schetto

class ArrayExtensionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // 配列要素数7 (最大インデックス6)
    private let sample = ["B", "C", "D", "E", "F", "G", "H"]
    private let empty: [String] = []
    
    func test_firstIndex() {
        XCTAssertEqual(sample.firstIndex, 0)
        XCTAssertEqual(empty.firstIndex, sample.invalidIndex, "空配列のfirstIndexはinvalidIndexであること")
    }
    
    func test_lastIndex() {
        XCTAssertEqual(sample.lastIndex, 6)
        XCTAssertEqual(empty.lastIndex, sample.invalidIndex, "空配列ののlastIndexはinvalidIndexであること")
    }
    
    func test_pushed() {
        let arr = sample
        XCTAssertEqual(arr.pushed("I"), ["B", "C", "D", "E", "F", "G", "H", "I"], "末尾に値が足されること")
        XCTAssertEqual(arr, sample, "元の配列は変更されないこと")
    }
    
    func test_poped() {
        let arr = sample
        XCTAssertEqual(arr.popped(), ["B", "C", "D", "E", "F", "G"], "末尾の値が除かれること")
        XCTAssertEqual(arr, sample, "元の配列は変更されないこと")
    }
    
    func test_unshifted() {
        let arr = sample
        XCTAssertEqual(arr.unshifted("A"), ["A", "B", "C", "D", "E", "F", "G", "H"], "先頭に値が足されること")
        XCTAssertEqual(arr, sample, "元の配列は変更されないこと")
    }
    
    func test_shifted() {
        let arr = sample
        XCTAssertEqual(arr.shifted(), ["C", "D", "E", "F", "G", "H"], "先頭の値が除かれること")
        XCTAssertEqual(arr, sample, "元の配列は変更されないこと")
    }
    
    func test_inRange() {
        XCTAssertTrue(sample.inRange(at: 0))
        XCTAssertTrue(sample.inRange(at: 3))
        XCTAssertTrue(sample.inRange(at: 6))
        
        XCTAssertFalse(sample.inRange(at: 7), "要素7個の配列でinRange:7はfalseを返すこと")
        XCTAssertFalse(sample.inRange(at: -1), "要素7個の配列でinRange:-1はfalseを返すこと")
        XCTAssertFalse(empty.inRange(at: 0), "空配列でinRange:0はfalseを返すこと")
    }
    
    func test_indexInRange() {
        XCTAssertEqual(sample.indexInRange(for: 0), 0)
        XCTAssertEqual(sample.indexInRange(for: -1), 0)
        XCTAssertEqual(sample.indexInRange(for: 3), 3)
        XCTAssertEqual(sample.indexInRange(for: 6), 6)
        XCTAssertEqual(sample.indexInRange(for: 7), 6)
        
        XCTAssertEqual(empty.indexInRange(for: -1), empty.invalidIndex)
        XCTAssertEqual(empty.indexInRange(for: 0), empty.invalidIndex)
        XCTAssertEqual(empty.indexInRange(for: 1), empty.invalidIndex)
    }
    
    func test_elementInRange() {
        XCTAssertEqual(sample.elementInRange(for: 0), "B")
        XCTAssertEqual(sample.elementInRange(for: -1), "B", "範囲以下のインデックスは先頭の要素を返すこと")
        XCTAssertEqual(sample.elementInRange(for: 3), "E")
        XCTAssertEqual(sample.elementInRange(for: 6), "H")
        XCTAssertEqual(sample.elementInRange(for: 7), "H", "範囲以上のインデックスは末尾の要素を返すこと")
        
        XCTAssertNil(empty.elementInRange(for: -1), "空配列ののelementInRangeはnilを返すこと")
        XCTAssertNil(empty.elementInRange(for: 0), "空配列ののelementInRangeはnilを返すこと")
        XCTAssertNil(empty.elementInRange(for: 1), "空配列ののelementInRangeはnilを返すこと")
    }
    
    func test_nextLoopIndex() {
        let arr = sample
        XCTAssertEqual(arr.nextLoopIndex(of: 3), 4)
        XCTAssertEqual(arr.nextLoopIndex(of: 4), 5)
        XCTAssertEqual(arr.nextLoopIndex(of: 5), 6)
        XCTAssertEqual(arr.nextLoopIndex(of: 6), 0)
        XCTAssertEqual(arr.nextLoopIndex(of: 7), 0)
        
        XCTAssertEqual(empty.nextLoopIndex(of: 0), sample.invalidIndex, "空配列のnextLoopIndexはinvalidIndexであること")
    }
    
    func test_previousLoopIndex() {
        let arr = sample
        XCTAssertEqual(arr.previousLoopIndex(of: 3), 2)
        XCTAssertEqual(arr.previousLoopIndex(of: 2), 1)
        XCTAssertEqual(arr.previousLoopIndex(of: 1), 0)
        XCTAssertEqual(arr.previousLoopIndex(of: 0), 6)
        XCTAssertEqual(arr.previousLoopIndex(of: -1), 6)
        
        XCTAssertEqual(empty.previousLoopIndex(of: 0), sample.invalidIndex, "空配列のpreviousLoopIndexはinvalidIndexであること")
    }
    
    func test_exchange() {
        let arr = sample
        XCTAssertEqual(arr.exchanged(from: 2, to: 5), ["B", "C", "G", "E", "F", "D", "H"], "DとGが入れ替わること")
        XCTAssertEqual(arr, sample, "元の配列は変更されないこと")
        XCTAssertEqual(arr.exchanged(from: -1, to: 5), ["B", "C", "D", "E", "F", "G", "H"], "範囲外の値がある場合は入れ替わらないこと")
        XCTAssertEqual(arr, sample, "元の配列は変更されないこと")
    }
}
