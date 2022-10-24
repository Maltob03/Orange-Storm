//
//  NotificationTimerView.swift
//  Final_product
//
//  Created by Filomena Stellino on 24/10/22.
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
