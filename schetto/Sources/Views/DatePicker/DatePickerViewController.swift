//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class DatePickerViewController: UIViewController {
    
    @IBOutlet private weak var calendarView: CalendarView!
    
    private var layouted = false

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCloseButtonOnNavigationBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if !layouted {
            calendarView.delegate = self
            calendarView.dataStore = self
            layouted = true
        }
    }
}

extension DatePickerViewController: CalendarViewDataStore, CalendarViewDelegate {

    func nibNameOfDayCell(_ calendarView: CalendarView) -> String {
        return "DatePickerDayView"
    }
    
    func nibNameOfWeekCell(_ calendarView: CalendarView) -> String {
        return "DatePickerWeekView"
    }
    
    func calendarView(_ calendarView: CalendarView, dayCell: CalendarViewDayCell, date: Date, month: Date) {
        
        
    }
    
    func calendarView(_ calendarView: CalendarView, weekCell: CalendarViewWeekCell, week: Date.Week) {
        
    }
    
    func calendarView(_ calendarView: CalendarView, didChangeMonth month: Date) {
        print(month.string())
    }
}

class DatePickerWeekView: CalendarViewWeekCell {
    
    @IBOutlet private weak var weekLabel: UILabel!
    
    override var week: Date.Week! {
        didSet {
            weekLabel.text = week.symbol
        }
    }
}

class DatePickerDayView: CalendarViewDayCell{
    
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
