//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

protocol DatePickerInteractorInput: class {
    
    var output: DatePickerInteractorOutput! { get set }
}

protocol DatePickerInteractorOutput: class {
    
}

class DatePickerRepository: DatePickerInteractorInput {
    
    weak var output: DatePickerInteractorOutput!
}
