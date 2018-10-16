//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

class EventTranslator: Translator {
    typealias Input = [Event]
    typealias Output = [Event]
    
    func translate(_ input: [Event]) -> [Event] {
        return input
    }
}
