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
    
    private let empty = ""
    
    func test_format() {
        XCTAssertEqual("hello %@".format("world") , "hello world")
        XCTAssertEqual("hello %d".format(1234) , "hello 1234")
        XCTAssertEqual("hello %@ %d".format("world", 1234) , "hello world 1234")
        XCTAssertEqual("hello %@ %05d".format("world", 1234) , "hello world 01234")
    }
    
    func test_emptyToNil() {
        XCTAssertEqual("hello".emptyToNil , "hello")
        XCTAssertEqual("".emptyToNil , nil)
    }
    
    func test_emptyTo() {
        XCTAssertEqual("hello".emptyTo("world") , "hello")
        XCTAssertEqual("".emptyTo("world") , "world")
    }
    
    func test_replace() {
        XCTAssertEqual("one two three".replace("two", "2") , "one 2 three")
        XCTAssertEqual("one two three".replace("four", "4") , "one two three")
    }
    
    func test_replace_range() {
        let range = NSMakeRange(6, 3)
        XCTAssertEqual("apple and orange".replace(range, "or") , "apple or orange")
    }
    
    func test_regularExpression() {
        let sentence = "for example #200, 43 add 76 is 119"
        XCTAssertEqual(sentence.matchedStrings("\\d{3}"), ["200", "119"])
        XCTAssertEqual(sentence.matchedStrings("[a-z]+"), ["for", "example", "add", "is"])
        
        XCTAssertEqual(sentence.matchedString("\\d{3}"), "200")
        XCTAssertEqual(sentence.matchedString("[a-z]+"), "for")
        XCTAssertEqual(sentence.matchedString("[A-Z]+"), nil)
        
        XCTAssertEqual(sentence.isMatched("\\d{3}"), true)
        XCTAssertEqual(sentence.isMatched("[a-z]+"), true)
        XCTAssertEqual(sentence.isMatched("[A-Z]+"), false)
    }
    
    func test_regularExpression_replace() {
        let sentence = "for example #200, 43 add 76 is 119"
        XCTAssertEqual(sentence.replaceMatched("\\d{3}", replacement: "?"), "for example #?, 43 add 76 is ?")
        XCTAssertEqual(sentence.replaceMatched("[a-z]+", replacement: "?"), "? ? #200, 43 ? 76 ? 119")
    }
    
    func test_regularExpression_remove() {
        let sentence = "for example #200, 43 add 76 is 119"
        XCTAssertEqual(sentence.removeMatched("\\d{3}"), "for example #, 43 add 76 is ")
        XCTAssertEqual(sentence.removeMatched("[a-z]+"), "  #200, 43  76  119")
    }
    
    func test_transform() {
        XCTAssertEqual("apple and orange".fullWidth, "ａｐｐｌｅ　ａｎｄ　ｏｒａｎｇｅ")
        XCTAssertEqual("ａｐｐｌｅ　and　ｏｒａｎｇｅ".fullWidth, "ａｐｐｌｅ　ａｎｄ　ｏｒａｎｇｅ")
        
        XCTAssertEqual("ａｐｐｌｅ　ａｎｄ　ｏｒａｎｇｅ".halfWidth, "apple and orange")
        XCTAssertEqual("ａｐｐｌｅ　and　ｏｒａｎｇｅ".halfWidth, "apple and orange")
        
        XCTAssertEqual("りんごとオレンジ".katakanaToHiragana, "りんごとおれんじ")
        XCTAssertEqual("りんごとオレンジ".hiraganaToKatakana, "リンゴトオレンジ")
    }
    
    func test_structureCheck() {
        XCTAssertEqual("apple".isOnlyNumber, false)
        XCTAssertEqual("apple".isOnlyUppercaseAlphabet, false)
        XCTAssertEqual("apple".isOnlyLowercasedAlphabet, true)
        XCTAssertEqual("apple".isOnlyAlphabet, true)
        XCTAssertEqual("apple".isOnlyAlphabetNumber, true)
        XCTAssertEqual("apple".isOnlyAlphabetAndWhitespace, true)
        XCTAssertEqual("apple".isOnlyAlphabetNumberAndWhitespace, true)
        
        XCTAssertEqual("APPLE".isOnlyNumber, false)
        XCTAssertEqual("APPLE".isOnlyUppercaseAlphabet, true)
        XCTAssertEqual("APPLE".isOnlyLowercasedAlphabet, false)
        XCTAssertEqual("APPLE".isOnlyAlphabet, true)
        XCTAssertEqual("APPLE".isOnlyAlphabetNumber, true)
        XCTAssertEqual("APPLE".isOnlyAlphabetAndWhitespace, true)
        XCTAssertEqual("APPLE".isOnlyAlphabetNumberAndWhitespace, true)
        
        XCTAssertEqual("12345".isOnlyNumber, true)
        XCTAssertEqual("12345".isOnlyUppercaseAlphabet, false)
        XCTAssertEqual("12345".isOnlyLowercasedAlphabet, false)
        XCTAssertEqual("12345".isOnlyAlphabet, false)
        XCTAssertEqual("12345".isOnlyAlphabetNumber, true)
        XCTAssertEqual("12345".isOnlyAlphabetAndWhitespace, false)
        XCTAssertEqual("12345".isOnlyAlphabetNumberAndWhitespace, true)
        
        XCTAssertEqual("apple12345".isOnlyNumber, false)
        XCTAssertEqual("apple12345".isOnlyUppercaseAlphabet, false)
        XCTAssertEqual("apple12345".isOnlyLowercasedAlphabet, false)
        XCTAssertEqual("apple12345".isOnlyAlphabet, false)
        XCTAssertEqual("apple12345".isOnlyAlphabetNumber, true)
        XCTAssertEqual("apple12345".isOnlyAlphabetAndWhitespace, false)
        XCTAssertEqual("apple12345".isOnlyAlphabetNumberAndWhitespace, true)
        
        XCTAssertEqual("apple 12345".isOnlyNumber, false)
        XCTAssertEqual("apple 12345".isOnlyUppercaseAlphabet, false)
        XCTAssertEqual("apple 12345".isOnlyLowercasedAlphabet, false)
        XCTAssertEqual("apple 12345".isOnlyAlphabet, false)
        XCTAssertEqual("apple 12345".isOnlyAlphabetNumber, false)
        XCTAssertEqual("apple 12345".isOnlyAlphabetAndWhitespace, false)
        XCTAssertEqual("apple 12345".isOnlyAlphabetNumberAndWhitespace, true)
    }
    
    func test_snakeToCamel() {
        XCTAssertEqual("apple_and_orange".snakeToCamel, "appleAndOrange")
        XCTAssertEqual("Apple_and_Orange".snakeToCamel, "appleAndOrange")
        XCTAssertEqual("Apple_and_ORANGE".snakeToCamel, "appleAndOrange")
        
        XCTAssertEqual("appleAndOrange".snakeToCamel, "appleandorange")
    }
    
    func test_camelToSnake() {
        XCTAssertEqual("appleAndOrange".camelToSnake, "apple_and_orange")
        XCTAssertEqual("AppleAndOrange".camelToSnake, "apple_and_orange")
        
        XCTAssertEqual("apple_and_orange".camelToSnake, "apple_and_orange")
    }
    
    func test_paddingZero() {
        XCTAssertEqual("1".paddingZero(length: 4), "0001")
        XCTAssertEqual("12".paddingZero(length: 4), "0012")
        XCTAssertEqual("123".paddingZero(length: 4), "0123")
        XCTAssertEqual("1234".paddingZero(length: 4), "1234")
        XCTAssertEqual("12345".paddingZero(length: 4), "12345")
        
        XCTAssertEqual("1".paddingZero(length: 4, prefix: false), "1000")
        XCTAssertEqual("12".paddingZero(length: 4, prefix: false), "1200")
        XCTAssertEqual("123".paddingZero(length: 4, prefix: false), "1230")
        XCTAssertEqual("1234".paddingZero(length: 4, prefix: false), "1234")
        XCTAssertEqual("12345".paddingZero(length: 4, prefix: false), "12345")
    }
}
