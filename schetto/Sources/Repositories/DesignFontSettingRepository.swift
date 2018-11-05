//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

protocol DesignFontSettingInteractorInput: class {
    
    var output: DesignFontSettingInteractorOutput! { get set }
}

protocol DesignFontSettingInteractorOutput: class {
    
}

class DesignFontSettingRepository: DesignFontSettingInteractorInput {
    
    weak var output: DesignFontSettingInteractorOutput!    
}
