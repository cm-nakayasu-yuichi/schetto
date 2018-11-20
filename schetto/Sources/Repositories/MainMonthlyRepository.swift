//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

protocol MainMonthlyInteractorInput: class {
    
    var output: MainMonthlyInteractorOutput! { get set }
}

protocol MainMonthlyInteractorOutput: class {
    
}

class MainMonthlyRepository: MainMonthlyInteractorInput {
    
    weak var output: MainMonthlyInteractorOutput!    
}
