//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

protocol EventInteractorInput: class {
    
    var output: EventInteractorOutput! { get set }
    
    func create()
    func copy(_ model: EventModel)
    func fetchList()
    func register(_ model: EventModel)
    func remove(_ model: EventModel)
}

protocol EventInteractorOutput: class {
    
    func created(model: EventModel)
    func copied(model: EventModel)
    func fetched(list: [EventModel])
    func registered(model: EventModel)
    func removed()
}

class EventRepository: EventInteractorInput {

    weak var output: EventInteractorOutput!
    
    func create() {
        let model = EventModel()
        let hour = Date.now.hour
        model.name = "新しい予定"
        model.start = Date.now.fixed(hour: hour + 1, minute: 0, second: 0)
        model.end = Date.now.fixed(hour: hour + 2, minute: 0, second: 0)
        output.created(model: model)
    }
    
    func copy(_ model: EventModel) {
        let translator = EventTranslator()
        let dbEntity = translator.detranslate(model)
        let copied = translator.translate(dbEntity)
        output.copied(model: copied)
    }
    
    func fetchList() {
        // TODO
        output.fetched(list: [])
    }
    
    func register(_ model: EventModel) {
        // TODO
        output.registered(model: model)
    }
    
    func remove(_ model: EventModel) {
        // TODO
        output.removed()
    }
}
