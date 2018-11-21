//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class DatePickerViewController: UIViewController {
    
    typealias CommitHandler = (Date) -> ()
    
    var dateTime: Date = .now
    var commitHandler: CommitHandler? = nil
    
    @IBOutlet private weak var calendarView: CalendarView!
    @IBOutlet private weak var hourPickerView: RepeatingPickerView!
    @IBOutlet private weak var minutePickerView: RepeatingPickerView!
    @IBOutlet private weak var menuTableView: UITableView!
    
    @IBOutlet private weak var calendarYearMonthLabel: UILabel!
    @IBOutlet private weak var yearLabel: UILabel!
    @IBOutlet private weak var monthDayLabel: UILabel!
    @IBOutlet private weak var weekLabel: UILabel!
    @IBOutlet private weak var hourLabel: UILabel!
    @IBOutlet private weak var minuteLabel: UILabel!
    
    @IBOutlet private weak var centerTopView: UIView!
    @IBOutlet private weak var centerBottomView: UIView!
    @IBOutlet private weak var bottomView: UIView!
    
    private var layouted = false

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCloseButtonOnNavigationBar()
        setupHourPickerView()
        setupMinutePickerView()
        
        centerTopView.dropShadowTop()
        centerBottomView.dropShadowBottom()
        bottomView.dropShadowTop()
        
        updateDateTime()
        updateCalendarYearMonth(month: dateTime)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if !layouted {
            calendarView.delegate = self
            calendarView.dataStore = self
            layouted = true
        }
    }
    
    private func setupHourPickerView() {
        hourPickerView.repeatingDelegate = self
        let components = [(0..<24).map { i -> String in i.string }]
        let indecies = [dateTime.hour]
        hourPickerView.set(rowsInComponents: components, indecies: indecies)
    }
    
    private func setupMinutePickerView() {
        minutePickerView.repeatingDelegate = self
        let components = [(0..<60).map { i -> String in i.string }]
        let indecies = [dateTime.minute]
        minutePickerView.set(rowsInComponents: components, indecies: indecies)
    }
    
    private func setupBottomView() {
//        bottomView.layer.masksToBounds = false
        bottomView.layer.shadowColor = UIColor.black.cgColor
        bottomView.layer.shadowOffset = CGSize(width: 0, height: -2)
        bottomView.layer.shadowOpacity = 0.15
        bottomView.layer.shadowRadius = 2
//        bottomView.layer.shadowPath = UIBezierPath(rect: bottomView.bounds).cgPath
    }
    
    private func updateDateTime() {
        yearLabel.text = dateTime.string(.custom(format: "yyyy年"))
        monthDayLabel.text = dateTime.string(.custom(format: "MM月dd日"))
        weekLabel.text = "(\(dateTime.weak.symbol))"
        hourLabel.text = dateTime.string(.custom(format: "HH"))
        minuteLabel.text = dateTime.string(.custom(format: "mm"))
    }
    
    private func updateCalendarYearMonth(month: Date) {
        calendarYearMonthLabel.text = month.string(.custom(format: "yyyy年MM月"))
    }
    
    @IBAction private func didTapOkButton() {
        Wireframe.dismiss(from: self)
    }
}

extension DatePickerViewController: CalendarViewDataStore, CalendarViewDelegate {

    func nibNameOfDayCell(_ calendarView: CalendarView) -> String {
        return "DatePickerDayCell"
    }
    
    func nibNameOfWeekCell(_ calendarView: CalendarView) -> String {
        return "DatePickerWeekCell"
    }
    
    func calendarView(_ calendarView: CalendarView, dayCell: CalendarViewDayCell, date: Date, month: Date) {
        
        
    }
    
    func calendarView(_ calendarView: CalendarView, weekCell: CalendarViewWeekCell, week: Date.Week) {
        
    }
    
    func calendarView(_ calendarView: CalendarView, didChangeMonth month: Date) {
        updateCalendarYearMonth(month: month)
    }
}

extension DatePickerViewController: RepeatingPickerViewDelegate {
    
    func repeatingPickerView(_ pickerView: RepeatingPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == hourPickerView {
            dateTime.hour = row
        }
        if pickerView == minutePickerView {
            dateTime.minute = row
        }
        updateDateTime()
    }
}

class DatePickerWeekCell: CalendarViewWeekCell {
    
    @IBOutlet private weak var weekLabel: UILabel!
    
    override var week: Date.Week! {
        didSet {
            weekLabel.text = week.symbol
        }
    }
}

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
