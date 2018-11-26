//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

// dataStore
protocol CalendarViewDataStore: class {
    
    func nibNameOfDayCell(_ calendarView: CalendarView) -> String
    
    func nibNameOfWeekCell(_ calendarView: CalendarView) -> String
    
    func calendarView(_ calendarView: CalendarView, dayCell: CalendarViewDayCell, date: Date, month: Date)
    
    func calendarView(_ calendarView: CalendarView, weekCell: CalendarViewWeekCell, week: Date.Week)
    
    func weeksHeight(_ calendarView: CalendarView) -> CGFloat
    
    func separatorWidth(_ calendarView: CalendarView) -> CGFloat
    
    func startWeek(_ calendarView: CalendarView) -> Date.Week
}
extension CalendarViewDataStore {
    
    func weeksHeight(_ calendarView: CalendarView) -> CGFloat {
        return 32.0
    }
    
    func separatorWidth(_ calendarView: CalendarView) -> CGFloat {
        return 0.0
    }
    
    func startWeek(_ calendarView: CalendarView) -> Date.Week {
        return .sunday
    }
}

// delegate
protocol CalendarViewDelegate: class {
    
    func calendarView(_ calendarView: CalendarView, didChangeMonth month: Date)
}

class CalendarView: UIView {
    
    weak var dataStore: CalendarViewDataStore! {
        didSet {
            if contentsCollectionView == nil {
                setupContentsCollectionView()
            }
        }
    }
    
    weak var delegate: CalendarViewDelegate?
    
    private var month = Date.now.firstDayOfMonth
    private var contentsCollectionView: UICollectionView!
    
    func reloadData() {
        contentsCollectionView.reloadItems(at: contentsCollectionView.indexPathsForVisibleItems)
    }
    
    func moveTo(year: Int, month: Int) -> Date {
        self.month = Date(year: year, month: month, day: 1, hour: 0, minute: 0, second: 0)
        contentsCollectionView.reloadData()
        return self.month
    }
    
    func moveToThisMonth() -> Date {
        let now = Date.now
        return moveTo(year: now.year, month: now.month)
    }
        
    private func setupContentsCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        contentsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        contentsCollectionView.parent = self
        contentsCollectionView.isPagingEnabled = true
        contentsCollectionView.showsHorizontalScrollIndicator = false
        _ = contentsCollectionView.addConstraint(allSideSpaceTo: self)
        contentsCollectionView.register(CalendarViewMonthCell.self, forCellWithReuseIdentifier: "month")
        contentsCollectionView.delegate = self
        contentsCollectionView.dataSource = self
        
        contentsCollectionView.backgroundColor = .clear
        contentsCollectionView.backgroundView = UIView(frame: .zero)
        
        contentsCollectionView.layoutIfNeeded()
        contentsCollectionViewToCenter()
    }
    
    private func reloadCalendarMonthCell(position: Int) {
        if position == 0 { return }
        month = month.added(month: position)
        contentsCollectionViewToCenter()
        delegate?.calendarView(self, didChangeMonth: month)
    }
    
    private func contentsCollectionViewToCenter() {
        contentsCollectionView.scrollToItem(at: IndexPath(1), at: .centeredHorizontally, animated: false)
        contentsCollectionView.reloadItems(at: contentsCollectionView.indexPathsForVisibleItems)
    }
}

extension CalendarView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "month", for: indexPath) as! CalendarViewMonthCell
        cell.calendarView = self
        cell.setupIfNeeded()
        cell.month = month.added(month: indexPath.row - 1)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let position = Int(ceil(scrollView.contentOffset.x / bounds.width)) - 1
        reloadCalendarMonthCell(position: position)
    }
}
