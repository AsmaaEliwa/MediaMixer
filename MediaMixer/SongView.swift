//
//  SongView.swift
//  MediaMixer
//
//  Created by asmaa gamal  on 28/12/2023.
//

import SwiftUI

struct SongView: View {
    var song:DataModel?
    @State private var albumImage: Image?
    var body: some View {
        VStack{
            
            albumImage?
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150).padding()
            Text(" \(song?.artist.name ?? "") : \(song?.title ?? "")").shadow(color: .black, radius: 3).font(.system(size: 20)).padding()
            HStack{
                
                Spacer()
                Button{
                    audioManger.shared.stopAudio()
                }label: {
                    Image(systemName: "stop.circle").resizable() // Make the image inside the button resizable
                        .frame(width: 50, height: 50)
                        .foregroundColor(.red)
                        .padding()
                }
                Button{
                    audioManger.shared.playAudioFromURL(urlString: song?.preview ?? "")
                }label: {
                    Image(systemName: "play.circle").resizable() // Make the image inside the button resizable
                        .frame(width: 50, height: 50)
                        .foregroundColor(.blue)
                        .padding()
                }
                Spacer()
            }.padding()
        }.onAppear {
            loadAlbumImage()
        }
        .onDisappear {
                   // Stop the audio when the view disappears
            audioManger.shared.stopAudio()
               }
    }
    func loadAlbumImage() {
           guard let urlString = song?.album.cover_small else { return }
           ImageLoader.loadImage(from: urlString) { image in
               self.albumImage = image
           }
       }

}

#Preview {
    SongView()
}

