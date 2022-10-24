//
//  Calendar.swift
//  Final_product
//
//  Created by Matteo Altobello on 24/10/22.
//

import SwiftUI

struct Calendar: View {
    
    
    
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
        
        @State private var dates: Set<DateComponents> = []

        var body: some View {
            
            VStack{
                /*Text("Calendar").font(.largeTitle.bold())
                    .frame(width: 300)
                    .offset(x:-10,y:-10)
                 */
                
                MultiDatePicker("Dates Available", selection: $dates, in: bounds)
                
                    .fixedSize(horizontal: true, vertical: FALSE)
            }.navigationTitle("")
        }
            
            
}

struct Calendar_Previews: PreviewProvider {
    static var previews: some View {
        Calendar()
    }
}



/*
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
     
     @State private var dates: Set<DateComponents> = []

     var body: some View {
         MultiDatePicker("Dates Available", selection: $dates, in: bounds)

             .fixedSize()
     }
 }
 */
