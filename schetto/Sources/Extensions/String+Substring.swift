//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

extension String {
    
    // [0..<9]
    subscript(bounds: CountableRange<Int>) -> String {
        return substring(start: bounds.lowerBound, end: bounds.upperBound - 1)
    }
    
    // [0..<9]
    subscript(bounds: CountableClosedRange<Int>) -> String {
        return substring(start: bounds.lowerBound, end: bounds.upperBound)
    }
    
    // [..<9]
    subscript(bounds: PartialRangeUpTo<Int>) -> String {
        return substring(start: 0, end: bounds.upperBound - 1)
    }
    
    // [...9]
    subscript(bounds: PartialRangeThrough<Int>) -> String {
        return substring(start: 0, end: bounds.upperBound)
    }
    
    // [0...]
    subscript(bounds: CountablePartialRangeFrom<Int>) -> String {
        return substring(start: bounds.lowerBound, end: count - 1)
    }
    
    func substring(start: Int, end: Int) -> String {
        let max = count - 1
        var s = start, e = end
        if max < 0 || e < s || max < s || e < 0 {
            return ""
        }
        s = s >= 0 ? s : 0
        e = max > e ? e : max
        
        let substringStart = index(startIndex, offsetBy: s)
        let substringEnd = index(startIndex, offsetBy: e)
        return String(self[substringStart...substringEnd])
    }
}
