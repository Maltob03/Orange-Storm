//
//  Date+Extension.swift
//  Orange_Storm
//
//  Created by Matteo Altobello on 28/10/22.
//

import Foundation

extension Date {
    func diff(numDays: Int) -> Date {
        Calendar.current.date(byAdding: .day, value: numDays, to: self)!
    }
    
    var startOfDay: Date {
        Calendar.current.startOfDay(for: self)
    }
}

