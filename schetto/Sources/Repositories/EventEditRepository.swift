//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

protocol EventEditInteractorInput: class {
    
    var output: EventEditInteractorOutput! { get set }
}

protocol EventEditInteractorOutput: class {
    
}

class EventEditRepository: EventEditInteractorInput {
    
    weak var output: EventEditInteractorOutput!    
}
