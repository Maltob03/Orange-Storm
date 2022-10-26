//
//  Calendar.swift
//  Orange_Storm
//
//  Created by Matteo Altobello on 24/10/22.
//

import SwiftUI

struct Calendar: View {
    
    let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter
        }()
        
    @State private var date = Date()

    var body: some View {
        NavigationView(){
            VStack{
                
                DatePicker("", selection: $date)
                                .datePickerStyle(GraphicalDatePickerStyle())
                                .frame(maxHeight: 400)
                NoteView()
                
                            }.navigationTitle("Diary")
            
            //End VStack
            
            


                            
                
                
                
                
                
                
                
            }
        }
                
    }

struct Calendar_Previews: PreviewProvider {
    static var previews: some View {
        Calendar()
    }
}



