//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class MainMonthlyDayCell: CalendarViewDayCell {
    
    @IBOutlet private weak var baseView: UIView!
    @IBOutlet private weak var dayLabel: UILabel!
    
    override var date: Date! {
        didSet {
            if date.isToday {
                baseView.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 0.7445954623)
                dayLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else if month.isSameMonth(date) {
                baseView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.75390625)
                if date.isSunday {
                    dayLabel.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
                } else if date.isSaturday {
                    dayLabel.textColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
                } else {
                    dayLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                }
            } else {
                baseView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.2505083476)
                dayLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            }
            
            dayLabel.text = date.day.string
        }
    }
}
