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
    
    func calculateNextHour(date: Date)
    func calculateNextMinute(date: Date)
}

protocol DatePickerViewProtocol: class {
	
    func close()
    func showConfirmClose()
    func showCalculatedDate(date: Date)
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
    
    func calculateNextHour(date: Date) {
        let periods = [0, 6, 12, 18, 24]
        for (i, _) in periods.enumerated() {
            if periods[i] <= date.hour && date.hour < periods[i + 1] {
                let calculated = date.fixed(hour: periods[i + 1])
                view.showCalculatedDate(date: calculated)
            }
        }
    }
    
    func calculateNextMinute(date: Date) {
        let periods = [0, 15, 30, 45, 60]
        for (i, _) in periods.enumerated() {
            if periods[i] <= date.minute && date.minute < periods[i + 1] {
                let calculated = date.fixed(minute: periods[i + 1])
                view.showCalculatedDate(date: calculated)
            }
        }
    }
}
