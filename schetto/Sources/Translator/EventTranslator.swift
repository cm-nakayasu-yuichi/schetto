//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

class EventTranslator: Translator {
    typealias Input = [DBEvent]
    typealias Output = [EventModel]
    
    func translate(_ input: [DBEvent]) -> [EventModel] {
        return []
    }
}
