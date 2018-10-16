//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation
import CoreGraphics

extension Int {
    
    /// 指定した範囲の中から乱数を取得する
    /// - Parameters:
    ///   - min: 最小値
    ///   - max: 最大値
    /// - Returns: 乱数
    static func random(min: Int, max: Int) -> Int {
        let n = min < 0 ? 0 : min
        let x = max + 1
        let v = UInt32(max < n ? 0 : x - n)
        let r = Int(arc4random_uniform(v))
        return n + r
    }
    
    /// 指定した範囲の中から乱数を取得する
    /// - Parameter range: 範囲
    /// - Returns: 乱数
    static func random(_ range: Range<Int>) -> Int {
        return random(min: range.lowerBound, max: range.upperBound)
    }
    
    /// 3桁区切りにフォーマットされた文字列
    var formatted: String {
        let fmt = NumberFormatter()
        fmt.numberStyle = .decimal
        fmt.groupingSeparator = ","
        fmt.groupingSize = 3
        return fmt.string(from: NSNumber(integerLiteral: self)) ?? ""
    }
}

extension Bool {
    
    /// 自身の真偽を反転させる
    mutating func reverse() -> Bool {
        self = !self
        return self
    }
    
    /// 自身の真偽を反転させた値を返す
    var reversed: Bool {
        return !self
    }
}

extension CGFloat {
    
    /// Intにキャストした値
    var int: Int {
        return Int(self)
    }
    
    /// Floatにキャストした値
    var float: Float {
        return Float(self)
    }
    
    /// Doubleにキャストした値
    var double: Double {
        return Double(self)
    }
    
    /// 文字列にキャストした値
    var string: String {
        return "\(self)"
    }
}

public extension Int {
    
    /// CGFloatにキャストした値
    var f: CGFloat { return CGFloat(self) }
    
    /// Floatにキャストした値
    var float: Float { return Float(self) }
    
    /// Doubleにキャストした値
    var double: Double { return Double(self) }
    
    /// 文字列にキャストした値
    var string: String { return "\(self)" }
}

public extension Float {
    
    /// CGFloatにキャストした値
    var f: CGFloat { return CGFloat(self) }
    
    /// Intにキャストした値
    var int: Int { return Int(self) }
    
    /// Doubleにキャストした値
    var double: Double { return Double(self) }
    
    /// 文字列にキャストした値
    var string: String { return "\(self)" }
}

public extension Double {
    
    /// CGFloatにキャストした値
    var f: CGFloat { return CGFloat(self) }
    
    /// Intにキャストした値
    var int: Int { return Int(self) }
    
    /// Floatにキャストした値
    var float: Float { return Float(self) }
    
    /// 文字列にキャストした値
    var string: String { return "\(self)" }
}
