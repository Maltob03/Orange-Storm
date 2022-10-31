//
//  Music.swift
//  Orange_Storm
//
//  Created by Matteo Altobello on 28/10/22.
//

import Foundation
import AVKit
import AudioToolbox


// Class for music
class SoundManager{
    
    static let instance = SoundManager ()
    var player : AVAudioPlayer?
    enum SoundOption : String {
        case Balloon
    }
    func playSound( sound: SoundOption){
        guard  let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        
        do {
            
            player  = try AVAudioPlayer (contentsOf: url)
            player?.play()
            
        } catch let error {
            print("error playing sound. \(error.localizedDescription )")
            
            
        }
    }
    func pauseSound( sound: SoundOption){
        
        
        guard  let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        
        do {
            
            player  = try AVAudioPlayer (contentsOf: url)
            player?.pause()
            
        } catch let error {
            print("error playing sound. \(error.localizedDescription )")
            
            
        }
    }
}
