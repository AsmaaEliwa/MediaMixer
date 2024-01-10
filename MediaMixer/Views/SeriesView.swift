//
//  SeriesView.swift
//  MediaMixer
//
//  Created by asmaa gamal  on 10/01/2024.
//

import SwiftUI

struct SeriesView: View {
    @State var query:String = ""
    @ObservedObject var networkManger:NetworkManger
    init(){
        networkManger = NetworkManger.shared
    }
    var body: some View {
        VStack{
            ScrollView{
                ForEach(networkManger.SeriesResult , id:\.self){movie in
                    MovieView(movie: movie)
                }
                
            }
        }
    }
}

#Preview {
    SeriesView()
}
