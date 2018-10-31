//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

protocol Detranslator {
    associatedtype Input
    associatedtype Output
    
    func detranslate(_ output: Output) -> Input
}
