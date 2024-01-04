//
//  SearchResultsView.swift
//  MediaMixer
//
//  Created by asmaa gamal  on 27/12/2023.
//

import SwiftUI

struct SearchResultsView: View {
    @ObservedObject var networkManager: NetworkManger

    init() {
        networkManager = NetworkManger.shared
    }

    var body: some View {
        List {
            ForEach(networkManager.searchResult?.data ?? [], id: \.self) { song in
                NavigationLink(destination: SongView(song: song)) {
                    Text("\(song.artist.name): \(song.title)")
                }
//                .simultaneousGesture(TapGesture().onEnded {
//                    networkManager.currentSong = song
//
//                })
            }
        }
    }
}

// Preview
struct SearchResultsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultsView()
    }
}
