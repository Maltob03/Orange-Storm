//
//  MainPage.swift
//  Orange_Storm
//
//  Created by Matteo Altobello on 24/10/22.
//

import SwiftUI
import AVKit
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
    //VAR FOR ALERT
    @State private var showingAlert = false
    @State var timeAlert = 30
    @State var state = ""
    //Var for haptic feedback
    let timerH = Timer.publish(every: 6, on: .main, in: .common).autoconnect()
    @State var TimerForHaptic = 30
    @State var boolHaptic = false
    
    //commento
    
    
    
    
    
    
    
    
    
    
    
    var body: some View {
        
        NavigationView {
            
            VStack{
                
                HStack{
                    if(hh2>12){
                        Text("Good Evening")
                            .font(.system(size: 26.8))
                            .bold()
                            .position(x:120, y: 30)
                        
                            .alert("Hey are you still breathing?", isPresented: $showingAlert) {
                                Button("Stay Here") {state = "OK"}
                                Button("Go to Calendar") {state = "OK" }
                            }
                        
                        
                    }
                    else{
                        
                        
                        
                        Text("Good Moorning")
                            .font(.system(size: 26.8))
                            .bold()
                            .position(x:120, y: 30)
                            .alert("Hey are you still breathing?", isPresented: $showingAlert) {
                                Button("Stay Here") {state = "OK"}
                                Button("Go to Calendar") {state = "OK" }
                            }
                        
                        
                        
                        
                    }
                    
                    
                    
                    
                    NavigationLink(
                        destination: EventsCalendarView(),
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
                        
                        let animation = Animation.linear (duration: 7)
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
                
                    .onReceive(timer) { _ in
                        if (timeAlert > 0 || state == "OK")  {
                            timeAlert -= 1
                            showingAlert = false
                        }
                        else {
                            showingAlert = true
                            
                        }
                    }
                
                    .onReceive(timerH) { _ in
                        if (TimerForHaptic > 0 && boolHaptic == true) {
                            TimerForHaptic -= 1
                            AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(kSystemSoundID_Vibrate)) {   }
                            
                        }
                        else {
                            TimerForHaptic = 30
                            
                        }
                    }
                
                
                if(timeRemaining>=6){
                    Text("Breath in").offset(x:0,y:50).font(.title2)
                        .fontWeight(.bold)
                    
                }
                else if (timeRemaining<6) {
                    Text("Breath out").offset(x:0,y:50).font(.title2)
                    .fontWeight(.bold)                }
                
                
                
                
                HStack{
                    
                    if(bool1 % 2 == 0) {
                        Image(systemName: "speaker.wave.2")
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .center)
                            .foregroundColor(.black)
                            .position(x: 100, y: 180)
                            .gesture(
                                TapGesture().onEnded { _ in
                                    bool1=bool1 + 1
                                    SoundManager .instance.playSound(sound:  .Balloon)
                                    
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
                                    SoundManager .instance.pauseSound(sound:  .Balloon)
                                    
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
                                    boolHaptic = true
                                    
                                    
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
                                    boolHaptic = false
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
