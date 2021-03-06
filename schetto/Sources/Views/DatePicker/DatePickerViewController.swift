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
    @IBOutlet private weak var wizardTableView: UITableView!
    
    @IBOutlet private weak var calendarYearMonthLabel: UILabel!
    @IBOutlet private weak var yearLabel: UILabel!
    @IBOutlet private weak var monthDayLabel: UILabel!
    @IBOutlet private weak var weekLabel: UILabel!
    @IBOutlet private weak var hourLabel: UILabel!
    @IBOutlet private weak var minuteLabel: UILabel!
    
    @IBOutlet private weak var centerTopView: UIView!
    @IBOutlet private weak var centerBottomView: UIView!
    @IBOutlet private weak var toolbar: UIView!
    
    private var wizardAdapter: DatePickerWizardAdapter!
    private var layouted = false

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCloseButtonOnNavigationBar()
        setupThisMonthButtonOnNavigationBar()
        setupDropShadow()
        setupHourPickerView()
        setupMinutePickerView()
        setupNavigationTitle()
        updateDateTime()
        updateCalendarYearMonth(month: dateTime)
        presenter.register(initialDateTime: dateTime)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if !layouted {
            calendarView.delegate = self
            calendarView.dataStore = self
            wizardAdapter = DatePickerWizardAdapter(wizardTableView, delegate: self)
            layouted = true
        }
    }
    
    private func setupNavigationTitle() {
        setNavigationTitle() { titleLabel in
            let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapTitleOnNavigationBar))
            titleLabel.parent?.addGestureRecognizer(gesture)
        }
    }
    
    private func setupThisMonthButtonOnNavigationBar() {
        setRightBarButtonSystemItem(.refresh, selector: #selector(didTapThisMonthButtonOnNavigationBar))
    }
    
    private func setupDropShadow() {
        centerTopView.dropShadowTop()
        centerBottomView.dropShadowBottom()
        toolbar.dropShadowTop()
    }
    
    private func setupHourPickerView() {
        hourPickerView.repeatingDelegate = self
        let components = [(0..<24).map { i -> String in i.paddingZero(length: 2) }]
        let indecies = [dateTime.hour]
        hourPickerView.set(rowsInComponents: components, indecies: indecies)
    }
    
    private func setupMinutePickerView() {
        minutePickerView.repeatingDelegate = self
        let components = [(0..<60).map { i -> String in i.paddingZero(length: 2) }]
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
    
    private func updatePickerViews() {
        hourPickerView.moveToCenter(row: dateTime.hour, forComponent: 0)
        minutePickerView.moveToCenter(row: dateTime.minute, forComponent: 0)
    }
    
    private func updateCalendarYearMonth(month: Date) {
        calendarYearMonthLabel.text = month.string(.custom(format: "yyyy年MM月"))
    }
    
    override func didTapCloseButtonOnNavigationBar() {
        presenter.check(dateTime: dateTime)
    }
    
    @IBAction private func didTapHourButton() {
        presenter.calculateNextHour(date: dateTime)
    }
    
    @IBAction private func didTapMinuteButton() {
        presenter.calculateNextMinute(date: dateTime)
    }
    
    @IBAction private func didTapOkButton() {
        self.commitHandler(self.dateTime)
        self.close()
    }
    
    @objc private func didTapTitleOnNavigationBar() {
    }
    
    @objc private func didTapThisMonthButtonOnNavigationBar() {
        let month = calendarView.moveToThisMonth()
        updateCalendarYearMonth(month: month)
    }
}

extension DatePickerViewController: DatePickerViewProtocol {
    
    func close() {
        Wireframe.dismiss(from: self)
    }
    
    func showConfirmClose() {
        Wireframe.showConfirmChange(from: self, didSave: {
            self.didTapOkButton()
        }, didClose: {
            self.close()
        })
    }
    
    func showCalculatedDate(date: Date) {
        let monthChanged = !dateTime.isSameMonth(date)
        dateTime = date
        updateDateTime()
        updatePickerViews()
        
        if monthChanged {
            let month = calendarView.moveTo(year: dateTime.year, month: dateTime.month)
            updateCalendarYearMonth(month: month)
        }
        
        calendarView.reloadData()
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
        let cell = dayCell as! DatePickerDayCell
        cell.delegate = self
        cell.state = cellState(date: date)
    }
    
    func calendarView(_ calendarView: CalendarView, weekCell: CalendarViewWeekCell, week: Date.Week) {
        // nop.
    }
    
    func calendarView(_ calendarView: CalendarView, didChangeMonth month: Date) {
        updateCalendarYearMonth(month: month)
    }
    
    private func cellState(date: Date) -> DatePickerDayCell.State {
        if dateTime.isSameDay(date) {
            return .selected
        } else if date.isToday {
            return .today
        } else {
            return .default
        }
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

extension DatePickerViewController: DatePickerDayCellDelegate {
    
    func datePickerDayCell(_ cell: DatePickerDayCell, date: Date) {
        dateTime = dateTime.fixed(year: date.year, month: date.month, day: date.day)
        updateDateTime()
        calendarView.reloadData()
    }
}

extension DatePickerViewController: DatePickerWizardAdapterDelegate {
    
}
