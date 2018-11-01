//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

protocol MainInteractorInput: class {
    
    var output: MainInteractorOutput! { get set }
}

protocol MainInteractorOutput: class {
    
}

class MainRepository: MainInteractorInput {
    
    weak var output: MainInteractorOutput!    
}
