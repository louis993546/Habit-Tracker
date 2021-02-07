//
//  Date+Extension.swift
//  Habit Tracker
//
//  Created by Louis Tsai on 2/7/21.
//

import Foundation

extension Date {

    func stripTime() -> Date {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: self)
        let date = Calendar.current.date(from: components)
        return date!
    }

}
