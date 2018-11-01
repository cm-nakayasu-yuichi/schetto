//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

class CalendarSettingModel {    
    var themes: Themes!
}

extension CalendarSettingModel {
    
    class Themes {
        var event: CalendarThemeModel!
        var frame: FrameThemes!
        var header: HeaderThemes!
        var cell: CellThemes!
        var month: MonthThemes!
        var weak: WeekThemes!
        
        init() {
            self.frame = FrameThemes()
            self.header = HeaderThemes()
            self.cell = CellThemes()
            self.month = MonthThemes()
            self.weak = WeekThemes()
        }
    }
}

extension CalendarSettingModel.Themes {
    
    class FrameThemes {
        var body: CalendarThemeModel?
        var haeder: CalendarThemeModel?
        var footer: CalendarThemeModel?
        var menu: CalendarThemeModel?
    }
    
    class CellThemes {
        var otherMonth: CalendarThemeModel?
        var selection: CalendarThemeModel?
        var today: CalendarThemeModel?
    }
    
    class HeaderThemes {
        var usual: CalendarThemeModel?
        var suturday: CalendarThemeModel?
        var sunday: CalendarThemeModel?
    }
    
    class MonthThemes {
        var january: CalendarThemeModel?
        var february: CalendarThemeModel?
        var march: CalendarThemeModel?
        var april: CalendarThemeModel?
        var may: CalendarThemeModel?
        var june: CalendarThemeModel?
        var july: CalendarThemeModel?
        var august: CalendarThemeModel?
        var september: CalendarThemeModel?
        var october: CalendarThemeModel?
        var november: CalendarThemeModel?
        var december: CalendarThemeModel?
    }
    
    class WeekThemes {
        var monday: CalendarThemeModel?
        var tuesday: CalendarThemeModel?
        var wednesday: CalendarThemeModel?
        var thursday: CalendarThemeModel?
        var friday: CalendarThemeModel?
        var suturday: CalendarThemeModel?
        var sunday: CalendarThemeModel?
        var holiday: CalendarThemeModel?
    }
}
