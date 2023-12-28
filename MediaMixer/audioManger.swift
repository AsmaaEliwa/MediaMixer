//
//  audioManger.swift
//  MediaMixer
//
//  Created by asmaa gamal  on 28/12/2023.
//
import AVFoundation
import Foundation
class audioManger{
    static let shared = audioManger()
    var player: AVPlayer?
    
    func playAudioFromURL(urlString: String) {
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        player = AVPlayer(url: url)
        player?.play()
    }
    func stopAudio() {
        player?.pause() // Pauses the playback

        // Resets the playback to the start
        player?.seek(to: CMTime.zero)
    }
}
