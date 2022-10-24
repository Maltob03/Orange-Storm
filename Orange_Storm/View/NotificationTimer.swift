//
//  NotificationTimer.swift
//  Orange_Storm
//
//  Created by Matteo Altobello on 24/10/22.
//

import SwiftUI

struct NotificationTimerView: View {
    var body: some View {
        List{
            
            Text("10min")
            Text("20min")
            Text("1h")
            
        }.navigationTitle("Notification Timer")
    }
    
    struct NotificationTimerView_Previews: PreviewProvider {
        static var previews: some View {
            NotificationTimerView()
        }
    }
}
