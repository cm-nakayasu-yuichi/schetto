//
//  MyProject
//  Copyright (c) Yuichi Nakayasu. All rights reserved.
//
import Foundation

struct CalendarSetting: Codable {
//    let colorType: Int
//    let monthlyStartWeek: Int
//    let weeklyStartWeek: Int
    
    let headerTheme: CalendarTheme?
    let calendarTheme: CalendarTheme?
    let footerTheme: CalendarTheme?
    let menuTheme: CalendarTheme?
    
    let headerUsualdayTheme: CalendarTheme?
    let headerSaturdayTheme: CalendarTheme?
    let headerSundayTheme: CalendarTheme?
    
    let eventTheme: CalendarTheme?
    
    let otherMonthTheme: CalendarTheme?
    let selectionTheme: CalendarTheme?
    let todayTheme: CalendarTheme?
    
    let mondayTheme: CalendarTheme?
    let tuesdayTheme: CalendarTheme?
    let wednesdayTheme: CalendarTheme?
    let thursdayTheme: CalendarTheme?
    let fridayTheme: CalendarTheme?
    let suturdayTheme: CalendarTheme?
    let sundayTheme: CalendarTheme?
    let holidayTheme: CalendarTheme?
    
    let januaryTheme: CalendarTheme?
    let februaryTheme: CalendarTheme?
    let marchTheme: CalendarTheme?
    let aprilTheme: CalendarTheme?
    let mayTheme: CalendarTheme?
    let juneTheme: CalendarTheme?
    let julyTheme: CalendarTheme?
    let augustTheme: CalendarTheme?
    let septemberTheme: CalendarTheme?
    let octoberTheme: CalendarTheme?
    let novemberTheme: CalendarTheme?
    let decemberTheme: CalendarTheme?
}

struct CalendarTheme: Codable {
    let color: String
    let font: Int
    let bg: String
}
