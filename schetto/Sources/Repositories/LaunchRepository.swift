//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

protocol LaunchInteractorInput: class {
    
    var output: LaunchInteractorOutput! { get set }
}

protocol LaunchInteractorOutput: class {
    
}

class LaunchRepository: LaunchInteractorInput {
    
    weak var output: LaunchInteractorOutput!    
}
