//
//  NoteView.swift
//  Orange_Storm
//
//  Created by Mario Lucci on 25/10/22.
//

import SwiftUI

struct NoteView: View {
    @State private var inputText = ""
    @State private var inputText2 = ""
    @State private var inputText3 = ""
    @State private var inputText4 = ""
    var body: some View {
        VStack{
            Text("Diary")
                .fontWeight(.bold)
            Text("July , 5th 2022")
                .fontWeight(.bold)
            
            List{
                Text("How do you feel?")
                    .fontWeight(.bold)
                    
                TextEditor(text: $inputText)
                Text("What appened?")
                    .fontWeight(.bold)
                TextEditor(text: $inputText2)
                Text("How did  you feel?")
                    .fontWeight(.bold)
                TextEditor(text: $inputText3)
                Text("What do you think agitated you?")
                    .fontWeight(.bold)
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
