//
//  NetworkManger.swift
//  MediaMixer
//
//  Created by asmaa gamal  on 27/12/2023.
//

import Foundation
class NetworkManger:ObservableObject{
    @Published var searchResult: SearchModel?
    @Published var currentIndex: Int = 0
    @Published var currentSong: DataModel?
    static let shared = NetworkManger()
    private init(){}
    
    func search(query:String){
       
        let url = "https://api.deezer.com/search?q=\(query)"
        let decoder = JSONDecoder()
        APIManger.shared.getRequest(url: url) { data in
            if let jsonData = data {
                
                do {
                    let result = try decoder.decode(SearchModel.self, from:jsonData )
                    DispatchQueue.main.sync{
                        self.searchResult = result
                    }
                   
                }catch{
                    print(error)
                    
                }
            }
        }
    }
    
    func playNextSong() {
        guard let searchResult = searchResult, !searchResult.data.isEmpty else { return }

        currentIndex += 1
        if currentIndex >= searchResult.data.count {
            currentIndex = 0 // Reset to the first song if we've gone past the end
        }

        updateCurrentSong()
    }

    func playPreviousSong() {
        guard let searchResult = searchResult, !searchResult.data.isEmpty else { return }

        currentIndex -= 1
        if currentIndex < 0 {
            currentIndex = searchResult.data.count - 1 // Set to the last song if we've gone past the beginning
        }

        updateCurrentSong()
    }

        // Helper method to update the current song
    private func updateCurrentSong() {
        DispatchQueue.main.async {
            if let searchResult = self.searchResult, !searchResult.data.isEmpty {
                self.currentSong = searchResult.data[self.currentIndex]
                audioManger.shared.playAudioFromURL(urlString: self.currentSong?.preview ?? "")
                
            }
        }
    }
    
}
