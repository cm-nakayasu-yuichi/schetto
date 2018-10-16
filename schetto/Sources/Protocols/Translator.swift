//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

protocol Translator {
    associatedtype Input
    associatedtype Output
    
    func translate(_ input: Input) -> Output
}
