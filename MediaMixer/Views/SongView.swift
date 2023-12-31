//
//  SongView.swift
//  MediaMixer
//
//  Created by asmaa gamal  on 28/12/2023.
//

import SwiftUI

struct SongView: View {
    var song:DataModel
    @State  var albumImage: UIImage?
    @ObservedObject var networkManager = NetworkManger.shared
    @State var showShare = false
    
    var body: some View {
        VStack{
            
            Image(uiImage: albumImage ?? UIImage())
                  
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150).padding()
            Text(" \(networkManager.currentSong?.artist.name ?? "" ) : \(networkManager.currentSong?.title ?? ""  )").shadow(color: .black, radius: 3).font(.system(size: 20)).padding()
            HStack{
                Button{
                    showShare = true
                }label: {
                    Image(systemName: "square.and.arrow.up")
                }
                Button{
                    DataManger.shared.addToFav(song: networkManager.currentSong! )
                }label: {
                    Image(systemName: "bookmark")
                }
                
            }
            HStack{
                
                Spacer()
                Button{
                    networkManager.playPreviousSong()
                    loadAlbumImage()
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
                    audioManger.shared.playAudioFromURL(urlString: networkManager.currentSong?.preview ?? "" )
                }label: {
                    Image(systemName: "play.circle").resizable() // Make the image inside the button resizable
                        .frame(width: 50, height: 50)
                        .foregroundColor(.blue)
                        .padding()
                }
                Button{
                    networkManager.playNextSong()
                    loadAlbumImage()
                }label: {
                    Image(systemName: "forward")
                }
                Spacer()
                    .sheet(isPresented: $showShare, content: {
                        ActivShareView(activityItems: [song])
                            })
            }.padding()

        }.onAppear {
            
            networkManager.currentSong = song
            loadAlbumImage()
          
        }
        .onDisappear {
                   // Stop the audio when the view disappears
            audioManger.shared.stopAudio()
            networkManager.currentSong = nil
            
               }
    }
     
    func loadAlbumImage() {
        guard let urlString = networkManager.currentSong?.album.cover_small else { return  } 
           ImageLoader.loadImage(from: urlString) { image in
               self.albumImage = image
           }
       }

}

//#Preview {
//    SongView()
//}

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
