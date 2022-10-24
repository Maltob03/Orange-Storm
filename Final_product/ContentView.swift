//
//  ContentView.swift
//  Final_product
//
//  Created by Matteo Altobello on 24/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "moon")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("buonanotte")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
