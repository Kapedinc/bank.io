//
//  Date+Extension.swift
//  Bank.io
//

import Foundation

extension Date {
    
    // MARK: - Private computed properties:
    
    /// Calendar to work with:
    private var calendar: Calendar {
        Calendar.current
    }
    
    // MARK: - Functions:
    
    /// Returns a date based on the provided date components:
    func dateWithComponents(
        withYear year: Int? = nil,
        withMonth month: Int? = nil,
        withDay day: Int? = nil,
        withHour hour: Int? = nil,
        withMinute minute: Int? = nil
    ) -> Self {
        
        /// Date components based on the values provided:
        let dateComponents: DateComponents = DateComponents(
            year: year,
            month: month,
            day: day,
            hour: hour,
            minute: minute
        )
        
        /// Creating a date in the current calendar based on the components:
        let date: Date = calendar.date(from: dateComponents) ?? .now
        
        /// Returning the date:
        return date
    }
}
