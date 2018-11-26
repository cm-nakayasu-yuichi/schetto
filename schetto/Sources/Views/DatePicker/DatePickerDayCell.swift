//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

protocol DatePickerDayCellDelegate: class {
    
    func datePickerDayCell(_ cell: DatePickerDayCell, date: Date)
}

class DatePickerDayCell: CalendarViewDayCell {
    
    enum State {
        case `default`
        case today
        case selected
    }
    
    weak var delegate: DatePickerDayCellDelegate!
    
    @IBOutlet private weak var dayLabel: UILabel!
    @IBOutlet private weak var dayButton: UIButton!
    
    override var date: Date! {
        didSet {
            setupDayButton()
            if !month.isSameMonth(date) {
                visibleDayButton(false)
                return
            }
            visibleDayButton(true)
            dayLabel.text = date.day.string
        }
    }
    
    var state: State = .default {
        didSet {
            UIView.setAnimationsEnabled(false)
            if state == .default {
                dayLabel.backgroundColor = .clear
                dayLabel.textColor = #colorLiteral(red: 0.2078431373, green: 0.2196078431, blue: 0.2470588235, alpha: 1)
            }
            if state == .today {
                dayLabel.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                dayLabel.textColor = #colorLiteral(red: 0.2078431373, green: 0.2196078431, blue: 0.2470588235, alpha: 1)
            }
            if state == .selected {
                dayLabel.backgroundColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 0.6235294118, alpha: 1)
                dayLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            dayLabel.layoutIfNeeded()
            dayButton.layoutIfNeeded()
            UIView.setAnimationsEnabled(true)
        }
    }
    
    @IBAction private func didTapDayButton() {
        delegate.datePickerDayCell(self, date: date)
    }
    
    private func setupDayButton() {
        dayLabel.corner = dayLabel.frame.width / 2
        dayButton.corner = dayButton.frame.width / 2
    }
    
    private func visibleDayButton(_ visble: Bool) {
        dayLabel.isHidden = !visble
        dayButton.isHidden = !visble
    }
}
