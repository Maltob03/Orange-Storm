//
//  SettingsPage.swift
//  Orange_Storm
//
//  Created by Matteo Altobello on 24/10/22.
//


import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
        
        
            List{
                
                
                
                Toggle(isOn: /*@PLACEHOLDER=Is On@*/.constant(false)) {
                    Text("Sound")
                    
                }
                Toggle(isOn: /*@PLACEHOLDER=Is On@*/.constant(true)) {
                    Text("Vibrance")
                }
                Toggle(isOn: /*@PLACEHOLDER=Is On@*/.constant(false)) {
                    Text("Voice")
                }
                
                NavigationLink(destination: NotificationTimerView()) {
                    Text("Notification Timer")
                    
                }
                
                
            } .navigationTitle("Settings")
            
        }
    }
    
    struct Setting_View_Previews: PreviewProvider {
        static var previews: some View {
            SettingsView()
        }
    }
}

