//
//  MainPage.swift
//  Orange_Storm
//
//  Created by Matteo Altobello on 24/10/22.
//

import SwiftUI

struct MainPageView: View {
    
    @State private var isAnimating =  false
    
    
    var body: some View {
        
        NavigationView {
                VStack{
                    
                    ZStack{
                        Circle()
                            .foregroundColor(Color(red: 0.415, green: 0.901, blue: 1.01))
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 375.0, height: 375.0)
                        Circle()
                            .frame(width: 275.0, height: 275.0)
                            .foregroundColor(Color(red: 0.515, green: 0.832, blue: 0.908))
                        Circle()
                            .frame(width: 150.0, height: 150.0)
                            .foregroundColor(Color(red: 0.456, green: 0.697, blue: 0.749))
                        
                    }

                    
                } .navigationTitle("Good Morning, Andrea")
            
            }
            
        }
    }
    
    struct MainPageView_Previews: PreviewProvider {
        static var previews: some View {
            MainPageView()
        }
    }
