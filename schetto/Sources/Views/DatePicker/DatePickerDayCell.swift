//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class DatePickerDayCell: CalendarViewDayCell{
    
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
}
