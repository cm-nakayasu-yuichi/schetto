//
//  NewProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class DatePickerViewController: UIViewController {
    
    typealias CommitHandler = (Date) -> ()
    
    var presenter: DatePickerPresenterProtocol!
    
    var dateTime: Date!
    var commitHandler: CommitHandler!
    
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
    @IBOutlet private weak var toolbar: UIView!
    
    private var layouted = false

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCloseButtonOnNavigationBar()
        setupHourPickerView()
        setupMinutePickerView()
        
        centerTopView.dropShadowTop()
        centerBottomView.dropShadowBottom()
        toolbar.dropShadowTop()
        
        updateDateTime()
        updateCalendarYearMonth(month: dateTime)
        presenter.register(initialDateTime: dateTime)
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
    
    override func didTapCloseButtonOnNavigationBar() {
        presenter.check(dateTime: dateTime)
    }
    
    @IBAction private func didTapOkButton() {
        
    }
}

extension DatePickerViewController: DatePickerViewProtocol {
    
    func close() {
        Wireframe.dismiss(from: self)
    }
    
    func showConfirmClose() {
        Wireframe.showConfirmChange(from: self, didSave: {
            self.commitHandler(self.dateTime)
            self.close()
        }, didClose: {
            self.close()
        })
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
