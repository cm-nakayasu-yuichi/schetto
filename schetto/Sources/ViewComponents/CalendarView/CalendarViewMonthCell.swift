//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class CalendarViewMonthCell: UICollectionViewCell {
    
    weak var calendarView: CalendarView!
    
    var month: Date! {
        didSet {
            let startWeek = calendarView.dataStore.startWeek(calendarView)
            days = Date.datesMatrixForCalendar(year: month.year, month: month.month, startWeek: startWeek)
            daysCollectionView.reloadItems(at: daysCollectionView.indexPathsForVisibleItems)
            
            weeks = Date.Week.weeks(startWeek: startWeek)
            weeksCollectionView.reloadItems(at: weeksCollectionView.indexPathsForVisibleItems)
        }
    }
    
    private var headerView: UIView!
    private var bodyCollectionView: UICollectionView!
    
    private var weeksCollectionView: UICollectionView!
    private var daysCollectionView: UICollectionView!
    
    private var weeks: [Date.Week]!
    private var days: [Date]!
    
    func setupIfNeeded() {
        if weeksCollectionView == nil && daysCollectionView == nil {
            setupSelfView()
            setupWeeksCollectionView()
            setupDaysCollectionView()
            setupLayoutConstraints()
        }
    }
    
    private func setupSelfView() {
        backgroundColor = .clear
        backgroundView = UIView(frame: .zero)
    }
    
    private func setupWeeksCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        weeksCollectionView = UICollectionView(frame: .zero, collectionViewLayout:layout)
        weeksCollectionView.parent = self
        
        registerWeekCell()
        
        weeksCollectionView.backgroundColor = .clear
        weeksCollectionView.backgroundView = UIView(frame: .zero)
        
        weeksCollectionView.delegate = self
        weeksCollectionView.dataSource = self
    }
    
    private func setupDaysCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        daysCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        daysCollectionView.parent = self
        
        registerDayCell()
        
        daysCollectionView.backgroundColor = .clear
        daysCollectionView.backgroundView = UIView(frame: .zero)
        
        daysCollectionView.delegate = self
        daysCollectionView.dataSource = self
    }
    
    private func setupLayoutConstraints() {
        let weeksHeight = calendarView.dataStore.weeksHeight(calendarView)
        _ = weeksCollectionView.addConstraint(top: 0, trailing: 0, bottom: nil, leading: 0, to: self)
        _ = weeksCollectionView.addConstraint(height: weeksHeight)
        
        _ = daysCollectionView.addConstraint(top: nil, trailing: 0, bottom: 0, leading: 0, to: self)
        _ = daysCollectionView.addConstraint(topToBottomOf: weeksCollectionView, constant: 0)
    }
    
    private func registerWeekCell() {
        let name = calendarView.dataStore.nibNameOfWeekCell(calendarView)
        let nib = UINib(nibName: name, bundle: nil)
        weeksCollectionView.register(nib, forCellWithReuseIdentifier: "week")
    }
    
    private func registerDayCell() {
        let name = calendarView.dataStore.nibNameOfDayCell(calendarView)
        let nib = UINib(nibName: name, bundle: nil)
        daysCollectionView.register(nib, forCellWithReuseIdentifier: "day")
    }
}

extension CalendarViewMonthCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == weeksCollectionView {
            return 7 // 7weeks
        }
        if collectionView == daysCollectionView {
            return 7 * 6 // 7weeks * 6rows
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == weeksCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "week", for: indexPath) as! CalendarViewWeekCell
            if indexPath.row < weeks.count {
                let week = weeks[indexPath.row]
                cell.week = week
                calendarView.dataStore.calendarView(calendarView, weekCell: cell, week: week)
            }
            return cell
        }
        if collectionView == daysCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "day", for: indexPath) as! CalendarViewDayCell
            if indexPath.row < days.count {
                let date = days[indexPath.row]
                cell.month = month
                cell.date = date
                calendarView.dataStore.calendarView(calendarView, dayCell: cell, date: date, month: month)
            }
            return cell
        }
        abort() // dead code.
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let separatorWidth = calendarView.dataStore.separatorWidth(calendarView)
        let width = (collectionView.width - (separatorWidth * 8)) / 7
        
        if collectionView == weeksCollectionView {
            let weeksHeight = calendarView.dataStore.weeksHeight(calendarView)
            
            return CGSize(width, weeksHeight)
        }
        if collectionView == daysCollectionView {
            let height = (collectionView.height - (separatorWidth * 7)) / 6
            
            return CGSize(width, height)
        }
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return calendarView.dataStore.separatorWidth(calendarView)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return calendarView.dataStore.separatorWidth(calendarView)
    }
}
