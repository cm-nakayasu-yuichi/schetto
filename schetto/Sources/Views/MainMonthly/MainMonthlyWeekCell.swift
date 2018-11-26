//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class MainMonthlyWeekCell: CalendarViewWeekCell {
    
    @IBOutlet private weak var weekLabel: UILabel!
    
    override var week: Date.Week! {
        didSet {
            weekLabel.text = week.symbol
        }
    }
}
