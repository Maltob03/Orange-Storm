//
//  DataPicker.swift
//  Final_product
//
//  Created by Matteo Altobello on 24/10/22.
//

import Foundation

struct MultiDatePickerExample: View {
    @Environment(\.calendar) var calendar
    @Environment(\.timeZone) var timeZone
    
    var bounds: PartialRangeFrom<Date> {
        let start = calendar.date(
            from: DateComponents(
                timeZone: timeZone,
                year: 2022,
                month: 6,
                day: 20)
        )!
        
        return start...
        
    }
}
