//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class EventTranslator: MultiTranslator, MultiDetranslator {

    typealias Input = DBEvent
    typealias Output = EventModel
    
    func translate(_ input: DBEvent) -> EventModel {
        let model = EventModel()
        model.id = input.id
        model.name = input.name
        model.start = input.start
        model.end = input.end
        model.all = input.all
        model.summery = input.summery
        model.notify = input.notify
        model.color = UIColor(rgbString: input.color)
        model.status = RecordStatus(rawValue: input.status)!
        
        let stickerTranslator = StickerTranslator()
        model.stickers = stickerTranslator.translate(input.stickers.array)
        
        return model
    }
    
    func detranslate(_ output: EventModel) -> DBEvent {
        let db = DBEvent()
        db.id = output.id
        db.name = output.name
        db.start = output.start
        db.end = output.end
        db.all = output.all
        db.summery = output.summery
        db.notify = output.notify
        db.color = output.color?.rgbString ?? ""
        db.status = output.status.rawValue
        
        let stickerTranslator = StickerTranslator()
        db.stickers.set(stickerTranslator.detranslate(output.stickers))
        
        return db
    }
    
    func translate(_ inputs: [DBEvent]) -> [EventModel] {
        return inputs.map { input -> Output in
            return translate(input)
        }
    }
    
    func detranslate(_ outputs: [EventModel]) -> [DBEvent] {
        return outputs.map { output -> Input in
            return detranslate(output)
        }
    }
}
