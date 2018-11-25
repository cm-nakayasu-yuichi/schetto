//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

protocol DatePickerPresenterProtocol: class {
    
    var view: DatePickerViewProtocol! { get set }
    var interactor: DatePickerInteractorInput! { get set }
}

protocol DatePickerViewProtocol: class {
	
}

class DatePickerPresenter: NSObject, DatePickerPresenterProtocol {
    
    weak var view: DatePickerViewProtocol!
    
    var interactor: DatePickerInteractorInput!
}
