//
//  Date+Compare.swift
//  MCExtension
//
//  Created by MCExtension on 2019/4/13.
//

import UIKit

public extension Date {
    public func isInSameWeek(date: Date) -> Bool {
        return Calendar.current.isDate(self, equalTo: date, toGranularity: .weekOfYear)
    }
    
    public func isInSameMonth(date: Date) -> Bool {
        return Calendar.current.isDate(self, equalTo: date, toGranularity: .month)
    }
    
    public func isInSameYear(date: Date) -> Bool {
        return Calendar.current.isDate(self, equalTo: date, toGranularity: .year)
    }
    
    public func isInSameDay(date: Date) -> Bool {
        return Calendar.current.isDate(self, equalTo: date, toGranularity: .day)
    }
    
    public var isInThisWeek: Bool {
        return isInSameWeek(date: Date())
    }
    
    public var isInToday: Bool {
        return Calendar.current.isDateInToday(self)
    }
    
    public var isInTheFuture: Bool {
        return Date() < self
    }
    
    public var isInThePast: Bool {
        return self < Date()
    }
    
    func getLast6Month() -> Date? {
        return Calendar.current.date(byAdding: .month, value: -6, to: self)
    }
    
    func getLast3Month() -> Date? {
        return Calendar.current.date(byAdding: .month, value: -3, to: self)
    }
    
    func getYesterday() -> Date? {
        return Calendar.current.date(byAdding: .day, value: -1, to: self)
    }
    
    func getLast7Day() -> Date? {
        return Calendar.current.date(byAdding: .day, value: -7, to: self)
    }
    func getLast30Day() -> Date? {
        return Calendar.current.date(byAdding: .day, value: -30, to: self)
    }
    
    func getPreviousMonth() -> Date? {
        return Calendar.current.date(byAdding: .month, value: -1, to: self)
    }
    
    // This Month Start
    func getThisMonthStart() -> Date? {
        let components = Calendar.current.dateComponents([.year, .month], from: self)
        return Calendar.current.date(from: components)!
    }
    
    func getThisMonthEnd() -> Date? {
        let components: NSDateComponents = Calendar.current.dateComponents([.year, .month], from: self) as NSDateComponents
        components.month += 1
        components.day = 1
        components.day -= 1
        return Calendar.current.date(from: components as DateComponents)!
    }
    
    // Last Month Start
    func getLastMonthStart() -> Date? {
        let components: NSDateComponents = Calendar.current.dateComponents([.year, .month], from: self) as NSDateComponents
        components.month -= 1
        return Calendar.current.date(from: components as DateComponents)!
    }
    
    // Last Month End
    func getLastMonthEnd() -> Date? {
        let components: NSDateComponents = Calendar.current.dateComponents([.year, .month], from: self) as NSDateComponents
        components.day = 1
        components.day -= 1
        return Calendar.current.date(from: components as DateComponents)!
    }
    
    // Last Next Start
    func getNextMonthStart() -> Date? {
        let components: NSDateComponents = Calendar.current.dateComponents([.year, .month], from: self) as NSDateComponents
        components.month += 1
        return Calendar.current.date(from: components as DateComponents)!
    }
    
    // Last Next End
    func getNextMonthEnd() -> Date? {
        let components: NSDateComponents = Calendar.current.dateComponents([.year, .month], from: self) as NSDateComponents
        components.day = 1
        components.day += 1
        return Calendar.current.date(from: components as DateComponents)!
    }
    
    var startOfDay: Date {
        return Calendar.current.startOfDay(for: self)
    }
    
    var endOfDay: Date {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfDay)!
    }
    
    var startOfMonth: Date {
        let components = Calendar.current.dateComponents([.year, .month], from: startOfDay)
        return Calendar.current.date(from: components)!
    }
    
    var endOfMonth: Date {
        var components = DateComponents()
        components.month = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfMonth)!
    }
}
