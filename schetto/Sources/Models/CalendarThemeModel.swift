//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import UIKit

class CalendarThemeModel {
    var textColor: UIColor!
    var textFont: UIFont!
    var backgroundColor: UIColor!
    var backgroundImage: UIImage?
    
    init() {}
    
    init?(entity entityOrNil: CalendarTheme?) {
        guard let entity = entityOrNil else { return nil }
        self.textColor = UIColor(rgbString: entity.color)
        self.textFont = .subhead
        self.backgroundColor = UIColor(rgbString: entity.bg)
        self.backgroundImage = nil
    }
}
