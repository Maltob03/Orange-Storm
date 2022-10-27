//
//  CalendarView.swift
//  Orange_Storm
//
//  Created by Matteo Altobello on 24/10/22.
//

import SwiftUI

struct CalendarView: View {
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    @State private var date = Date()
    
    var body: some View {
        NavigationView(){
            ScrollView(.vertical){
                VStack{
                    DatePicker("", selection: $date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .frame(maxHeight: 400)
                    
                }
                .toolbar(content: {
                    ToolbarItem {
                        NavigationLink(
                            destination: NoteView(),
                            label: {
                                Image(systemName: "plus")
                                    .resizable()
                                    .frame(width: 30, height: 30, alignment: .center)
                                    .foregroundColor(.black)

                            })
                    }
                })
                .navigationTitle("Diary")
                //.frame(width: UIScreen.main.bounds.width, height: 1200)//End VStack
                
                
            }
            
        }
        
    }
}

struct Calendar_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}



