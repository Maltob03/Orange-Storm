//
//  Calendar.swift
//  Orange_Storm
//
//  Created by Matteo Altobello on 24/10/22.
//

import SwiftUI

struct Calendar: View {
        
    @State var selectedDates: Set<DateComponents> = []

    var body: some View {
        NavigationView(){
            VStack{
                MultiDatePicker("Travel Dates", selection: $selectedDates).fixedSize(horizontal: true, vertical: true)
                NoteView()
                
                
                
                
                
                
            }.navigationTitle("Diary")
        }
                
    }
            
}

struct Calendar_Previews: PreviewProvider {
    static var previews: some View {
        Calendar()
    }
}



