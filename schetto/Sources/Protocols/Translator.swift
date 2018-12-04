//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

protocol TranslateProtocol {
    
    associatedtype Input
    
    associatedtype Output
}

protocol Translator: TranslateProtocol {

    func translate(_ input: Input) -> Output
}

protocol Detranslator: TranslateProtocol {
    
    func detranslate(_ output: Output) -> Input
}

protocol MultiTranslator: Translator {
    
    func translate(_ inputs: [Input]) -> [Output]
}

protocol MultiDetranslator: Detranslator {
    
    func detranslate(_ outputs: [Output]) -> [Input]
}
