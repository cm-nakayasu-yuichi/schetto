//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

protocol ColorPickerPresenterProtocol: class {
    
    var view: ColorPickerViewProtocol! { get set }
    var interactor: ColorPickerInteractorInput! { get set }
    
    
}

protocol ColorPickerViewProtocol: class {
    
}

class ColorPickerPresenter: ColorPickerPresenterProtocol {
    
    weak var view: ColorPickerViewProtocol!
    
    var interactor: ColorPickerInteractorInput!
}

extension ColorPickerPresenter: ColorPickerInteractorOutput {
	
}
