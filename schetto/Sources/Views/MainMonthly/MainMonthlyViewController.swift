//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class MainMonthlyViewController: UIViewController {
    
    var presenter: MainMonthlyPresenterProtocol!
    var dateTime: Date = .now
    
    private var layouted = false
    
    @IBOutlet private weak var calendarView: CalendarView!

    override func viewDidLoad() {
        super.viewDidLoad()
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

extension MainMonthlyViewController: MainMonthlyViewProtocol {
    
}

extension MainMonthlyViewController: CalendarViewDataStore, CalendarViewDelegate {
    
    func nibNameOfDayCell(_ calendarView: CalendarView) -> String {
        return "MainMonthlyDayCell"
    }
    
    func nibNameOfWeekCell(_ calendarView: CalendarView) -> String {
        return "MainMonthlyWeekCell"
    }
    
    func calendarView(_ calendarView: CalendarView, dayCell: CalendarViewDayCell, date: Date, month: Date) {
        
        
    }
    
    func calendarView(_ calendarView: CalendarView, weekCell: CalendarViewWeekCell, week: Date.Week) {
        
    }
    
    func calendarView(_ calendarView: CalendarView, didChangeMonth month: Date) {
        
    }
}
