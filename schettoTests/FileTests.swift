//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import XCTest
@testable import schetto

class FileTests: XCTestCase {
    
    let testDirectory = File.documentDirectory + "test"
        
    override func setUp() {
        super.setUp()
        try? testDirectory.makeDirectory()
    }
    
    override func tearDown() {
        super.tearDown()
        try? testDirectory.delete()
    }
    
    func test_file_fields() {
        let dir = testDirectory
        XCTAssertEqual(dir.name, "test")
        XCTAssertEqual(dir.extension, "")
        XCTAssertEqual(dir.extensionWithoutDot, "")
        XCTAssertEqual(dir.nameWithoutExtension, "test")
        
        let file = testDirectory + "empty.txt"
        XCTAssertEqual(file.name, "empty.txt")
        XCTAssertEqual(file.extension, ".txt")
        XCTAssertEqual(file.extensionWithoutDot, "txt")
        XCTAssertEqual(file.nameWithoutExtension, "empty")
        XCTAssertEqual(file.directoryPath, dir.path)
    }
    
    func test_cycle() {
        let file = testDirectory + "empty.txt"
        XCTAssertFalse(file.exists)
        
        try? file.write(contents: "hoge")
        XCTAssertTrue(file.exists)
        
        XCTAssertEqual(file.contents, "hoge")
        
        try? file.delete()
        XCTAssertFalse(file.exists)
    }
    
    func test_cycle_ファイル存在がなくても異常な動作をしないか() {
        let file = testDirectory + "empty.txt"
        XCTAssertFalse(file.exists)
        
        XCTAssertEqual(file.isFile, false)
        XCTAssertEqual(file.contents, nil)
        XCTAssertEqual(file.image, nil)
        XCTAssertEqual(file.data, nil)
        XCTAssertEqual(file.attributes.count, 0)
        XCTAssertEqual(file.createdDate, nil)
        XCTAssertEqual(file.size, 0)
        
        let dst = testDirectory + "dst.txt"
        XCTAssertThrowsError(try file.delete())
        XCTAssertThrowsError(try file.copy(to: dst))
        XCTAssertThrowsError(try file.move(to: dst))
        XCTAssertThrowsError(try file.rename(to: "dst"))
    }
    
    func test_files() {
        let names = ["a.txt", "b.txt", "c.txt", "d.txt"]
        
        names.forEach {
            try? (testDirectory + $0).write(contents: "hoge")
        }
        XCTAssertEqual(testDirectory.fileNames, names)
    }
    
    func test_move_移動先が存在していない場合は通常に移動するかどうか() {
        let src = testDirectory + "aaa.txt"
        try? src.write(contents: "hoge")
        XCTAssertTrue(src.exists)
        
        let dst = testDirectory + "bbb.txt"
        XCTAssertFalse(dst.exists)
        
        try? src.move(to: dst)
        XCTAssertFalse(src.exists)
        XCTAssertTrue(dst.exists)
        XCTAssertEqual(dst.contents, "hoge")
    }
    
    func test_move_移動先が存在していても上書きで移動するかどうか() {
        let src = testDirectory + "aaa.txt"
        try? src.write(contents: "hoge")
        XCTAssertTrue(src.exists)
        
        let dst = testDirectory + "bbb.txt"
        try? dst.write(contents: "fuga")
        XCTAssertTrue(dst.exists)
        
        try? src.move(to: dst)
        XCTAssertFalse(src.exists)
        XCTAssertTrue(dst.exists)
        XCTAssertEqual(dst.contents, "hoge")
    }
    
    func test_move_移動先が存在していて上書きを禁止した場合は移動をとりやめるかどうか() {
        let src = testDirectory + "aaa.txt"
        try? src.write(contents: "hoge")
        XCTAssertTrue(src.exists)
        
        let dst = testDirectory + "bbb.txt"
        try? dst.write(contents: "fuga")
        XCTAssertTrue(dst.exists)
        
        try? src.move(to: dst, force: false)
        XCTAssertTrue(src.exists)
        XCTAssertTrue(dst.exists)
        XCTAssertEqual(dst.contents, "fuga")
    }
    
    func test_rename() {
        let src = testDirectory + "aaa.txt"
        try? src.write(contents: "hoge")
        XCTAssertTrue(src.exists)
        
        let dst = try! src.rename(to: "bbb.txt")
        XCTAssertFalse(src.exists)
        XCTAssertTrue(dst.exists)
        XCTAssertEqual(dst.contents, "hoge")
    }
    
    func test_copy_コピー先が存在していない場合は通常にコピーするかどうか() {
        let src = testDirectory + "aaa.txt"
        try? src.write(contents: "hoge")
        XCTAssertTrue(src.exists)
        
        let dst = testDirectory + "bbb.txt"
        XCTAssertFalse(dst.exists)
        
        try? src.copy(to: dst)
        XCTAssertTrue(src.exists)
        XCTAssertTrue(dst.exists)
        XCTAssertEqual(dst.contents, "hoge")
    }
    
    func test_copy_コピー先が存在していても上書きでコピーするかどうか() {
        let src = testDirectory + "aaa.txt"
        try? src.write(contents: "hoge")
        XCTAssertTrue(src.exists)
        
        let dst = testDirectory + "bbb.txt"
        try? dst.write(contents: "fuga")
        XCTAssertTrue(dst.exists)
        
        try? src.copy(to: dst)
        XCTAssertTrue(src.exists)
        XCTAssertTrue(dst.exists)
        XCTAssertEqual(dst.contents, "hoge")
    }
    
    func test_copy_コピー先が存在していて上書きを禁止した場合はコピーをとりやめるかどうか() {
        let src = testDirectory + "aaa.txt"
        try? src.write(contents: "hoge")
        XCTAssertTrue(src.exists)
        
        let dst = testDirectory + "bbb.txt"
        try? dst.write(contents: "fuga")
        XCTAssertTrue(dst.exists)
        
        try? src.copy(to: dst, force: false)
        XCTAssertTrue(src.exists)
        XCTAssertTrue(dst.exists)
        XCTAssertEqual(dst.contents, "fuga")
    }
}
