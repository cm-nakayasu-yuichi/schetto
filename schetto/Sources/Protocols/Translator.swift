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

protocol MultiTranslator: Translator {
    
    func translate(_ inputs: [Input]) -> [Output]
}
