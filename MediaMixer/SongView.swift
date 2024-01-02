//
//  SongView.swift
//  MediaMixer
//
//  Created by asmaa gamal  on 28/12/2023.
//

import SwiftUI

struct SongView: View {
    var song:DataModel?
    @State  var albumImage: Image?
    @ObservedObject var networkManager = NetworkManger.shared
    @State var showShare = false
    
    var body: some View {
        VStack{
            
            albumImage?
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150).padding()
            Text(" \(song?.artist.name ?? "") : \(song?.title ?? "")").shadow(color: .black, radius: 3).font(.system(size: 20)).padding()
            Button{
                showShare = true
            }label: {
                Image(systemName: "square.and.arrow.up")
            }
            HStack{
                
                Spacer()
                Button{
                    networkManager.playPreviousSong()
                }label: {
                    Image(systemName: "backward")
                }
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
                Button{
                    networkManager.playNextSong()
                }label: {
                    Image(systemName: "forward")
                }
                Spacer()
                    .sheet(isPresented: $showShare, content: {
                                ActivShareView(activityItems: [song])
                            })
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

struct ActivShareView:UIViewControllerRepresentable{
    let activityItems: [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let activityViewController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        return activityViewController
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        // Update the view controller if needed
    }
    
}
