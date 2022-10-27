//
//  NoteView.swift
//  Orange_Storm
//
//  Created by Mario Lucci on 25/10/22.
//

import SwiftUI

struct NoteView: View {
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    @State private var date = Date()
    
    
    
    
    @State private var inputText = ""
    @State private var inputText2 = ""
    @State private var inputText3 = ""
    @State private var inputText4 = ""
    var body: some View {
        VStack{
            Text("")
                .fontWeight(.bold).fixedSize(horizontal: false, vertical: true)
            Text("Date is \(date, formatter: dateFormatter)").fontWeight(.bold)
            
            List{
                Text("How do you feel?")
                    .font(.title2)
                    .fontWeight(.bold).fixedSize(horizontal: false, vertical: true)
                
                TextEditor(text: $inputText)
                Text("What happened?")
                    .font(.title2)
                    .fontWeight(.bold).fixedSize(horizontal: false, vertical: true)
                
                TextEditor(text: $inputText2)
                Text("How did you feel?")
                    .font(.title2)
                    .fontWeight(.bold).fixedSize(horizontal: false, vertical: true)
                TextEditor(text: $inputText3)
                Text("What do you think agitated you?")
                    .font(.title2)
                    .fontWeight(.bold).fixedSize(horizontal: false, vertical: true)
                TextEditor(text: $inputText4)
            }
            
        }
        
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView()
    }
}
