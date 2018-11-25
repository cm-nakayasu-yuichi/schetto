//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

protocol DatePickerPresenterProtocol: class {
    
    var view: DatePickerViewProtocol! { get set }
    var interactor: DatePickerInteractorInput! { get set }
    
    func register(initialDateTime: Date)
    func check(dateTime: Date)
}

protocol DatePickerViewProtocol: class {
	
    func close()
    func showConfirmClose()
}

class DatePickerPresenter: NSObject, DatePickerPresenterProtocol {
    
    weak var view: DatePickerViewProtocol!
    var interactor: DatePickerInteractorInput!
    var initialDateTime: Date!
    
    func register(initialDateTime: Date) {
        self.initialDateTime = initialDateTime
    }
    
    func check(dateTime: Date) {
        if dateTime == initialDateTime {
            view.close()
        } else {
            view.showConfirmClose()
        }
    }
}
