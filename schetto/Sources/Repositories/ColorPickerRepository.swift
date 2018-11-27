//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

protocol ColorPickerInteractorInput: class {
    
    var output: ColorPickerInteractorOutput! { get set }
}

protocol ColorPickerInteractorOutput: class {
    
}

class ColorPickerRepository: ColorPickerInteractorInput {
    
    weak var output: ColorPickerInteractorOutput!    
}
