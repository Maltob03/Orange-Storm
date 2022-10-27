//
//  MainPage.swift
//  Orange_Storm
//
//  Created by Matteo Altobello on 24/10/22.
//

import SwiftUI
import AudioToolbox

struct MainPageView: View {
    
    
    //Var for animation
    @State var isCenter = true
    @State var isCenter2 = true
    //Var for On/Off function
    @State var bool1 = 0
    @State var bool2 = 0
    //var for GOOD X func()
    let hh2 = (Calendar.current.component(.hour, from: Date()))
    //Var For Breath function
    @State var timeRemaining = 12
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
   


    
    
    
    var body: some View {
        
        NavigationView {
            
            VStack{
                HStack{
                    if(hh2>12){
                        Text("Good Evening")
                            .font(.system(size: 29.8))
                            .bold()
                            .position(x:120, y: 30)
                    }
                    else{
                        Text("Good Moorning")
                            .font(.system(size: 29.8))
                            .bold()
                            .position(x:120, y: 30)
                        
                    }
                    
                    NavigationLink(
                        destination: CalendarView (),
                        label: {
                            
                            Image(systemName: "calendar")
                                .resizable()
                                .frame(width: 30, height: 30, alignment: .center)
                                .foregroundColor(.black)
                                .position(x: 140, y: 30)
                        })
                    
                    
                }
                
                ZStack {
                    Circle()
                        .frame(width: 200, height: 200)
                        .foregroundColor(Color(red: 0.515, green: 0.832, blue: 0.908).opacity(0.5))
                        .offset(x: isCenter ? 0 : 50)
                        .rotationEffect(Angle(degrees: isCenter2 ? 0 : 360))
                    
                    Circle()
                        .frame(width: 200, height: 200)
                        .foregroundColor(Color(red: 0.515, green: 0.832, blue: 0.908).opacity(0.5))
                        .offset(x: isCenter ? 0 : -50)
                        .rotationEffect(Angle(degrees: isCenter2 ? 0 : 360))
                    
                    Circle()
                        .frame(width: 200, height: 200)
                        .foregroundColor(Color(red: 0.515, green: 0.832, blue: 0.908).opacity(0.5))
                        .offset(y: isCenter ? 0 : 50)
                        .rotationEffect(Angle(degrees: isCenter2 ? 0 : 360))
                    
                    Circle()
                        .frame(width: 200, height: 200)
                        .foregroundColor(Color(red: 0.515, green: 0.832, blue: 0.908).opacity(0.5))
                        .offset(y: isCenter ? 0 : -50)
                        .rotationEffect(Angle(degrees: isCenter2 ? 0: 360))
                    
                    
                    
                }
                Spacer(minLength: 20)
                    .onAppear() {
                        
                        let animation = Animation.linear (duration: 6)
                        withAnimation (animation.repeatForever(autoreverses: true)){
                            
                            self.isCenter = false
                        }
                        withAnimation (animation.repeatForever(autoreverses: true)){
                            
                            self.isCenter2  = false
                        }
                    }
                
                    .onReceive(timer) { _ in
                        if timeRemaining > 0 {
                            timeRemaining -= 1
                        }
                        else {
                            timeRemaining = 12
                        }
                    }
                
                if(timeRemaining>6){
                    Text("Breath in").offset(x:0,y:50)
                        
                }
                else{
                    Text("Breath out").offset(x:0,y:50)
                }
               
                 
                
                
                HStack{
                    
                    if(bool1 % 2 == 0){
                        Image(systemName: "speaker.wave.2")
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .center)
                            .foregroundColor(.black)
                            .position(x: 100, y: 180)
                            .gesture(
                                TapGesture().onEnded { _ in
                                    bool1=bool1 + 1
                                }
                            )
                        
                    }
                    else {
                        Image(systemName: "speaker.slash")
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .center)
                            .foregroundColor(.black)
                            .position(x: 100, y: 180).gesture(
                                TapGesture().onEnded { _ in
                                    bool1=bool1 + 1
                                }
                            )
                        
                    }
                    
                    
                    if(bool2 % 2 == 0){
                        Image(systemName: "iphone.radiowaves.left.and.right")
                            .resizable()
                            .frame(width: 45, height: 30, alignment: .center)
                            .foregroundColor(.black)
                            .position(x: 100, y: 180)
                            .gesture(
                                TapGesture().onEnded { _ in
                                    bool2=bool2 + 1
                                }
                            )
                        
                    }
                    else {
                        Image(systemName: "iphone.slash")
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .center)
                            .foregroundColor(.black)
                            .position(x: 100, y: 180).gesture(
                                TapGesture().onEnded { _ in
                                    bool2=bool2 + 1
                                    AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(kSystemSoundID_Vibrate)) {   }
                                }
                            ) 
                    
                        }
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                }
            }
            
            
            
        }
    }
}
struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}
