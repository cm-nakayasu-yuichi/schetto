//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

protocol TemplateInteractorInput: class {
    
    var output: TemplateInteractorOutput! { get set }
    
    func generate(type: TemplateType) -> TemplateModel
    func fetch(type: TemplateType, nameCondition: String?)
    func register(_ model: TemplateModel)
    func remove(_ model: TemplateModel)
}

protocol TemplateInteractorOutput: class {
    
    func fetched(_ models: [TemplateModel])
    func updated(_ models: [TemplateModel])
}

class TemplateRepository: TemplateInteractorInput {
    
    weak var output: TemplateInteractorOutput!
    
    func generate(type: TemplateType) -> TemplateModel {
        return TemplateModel()
    }
    
    func fetch(type: TemplateType, nameCondition: String?) {
        
    }
    
    func register(_ model: TemplateModel) {
        
    }
    
    func remove(_ model: TemplateModel) {
        
    }
}
