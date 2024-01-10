//
//  MovieSearchView.swift
//  MediaMixer
//
//  Created by asmaa gamal  on 09/01/2024.
//

import SwiftUI

struct MovieSearchView: View {
    @State var query:String = ""
    @ObservedObject var networkManger:NetworkManger
    init(){
        networkManger = NetworkManger.shared
    }
    var body: some View {
        VStack{
            ScrollView{
                ForEach(networkManger.MovieResult , id:\.self){movie in
                    MovieView(movie: movie)
                }
                
            }
        }
    }
}

#Preview {
    MovieSearchView()
}
