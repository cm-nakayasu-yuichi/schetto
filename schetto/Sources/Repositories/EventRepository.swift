//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

protocol EventInteractorInput: class {
    
    var output: EventInteractorOutput! { get set }
}

protocol EventInteractorOutput: class {
    
}

class EventRepository {
    
    weak var output: EventInteractorOutput!
}
