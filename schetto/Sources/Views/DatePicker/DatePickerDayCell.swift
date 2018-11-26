//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

protocol DatePickerDayCellDelegate: class {
    
    func datePickerDayCell(_ cell: DatePickerDayCell, date: Date)
}

class DatePickerDayCell: CalendarViewDayCell{
    
    weak var delegate: DatePickerDayCellDelegate!
    
    @IBOutlet private weak var dayButton: UIButton!
    
    override var date: Date! {
        didSet {
            if !month.isSameMonth(date) {
                dayButton.isHidden = true
                return
            }
            dayButton.isHidden = false
            dayButton.title = date.day.string
        }
    }
    
    @IBAction private func didTapDayButton() {
        delegate.datePickerDayCell(self, date: date)
    }
}
