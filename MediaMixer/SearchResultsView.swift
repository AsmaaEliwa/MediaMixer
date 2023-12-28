//
//  SearchResultsView.swift
//  MediaMixer
//
//  Created by asmaa gamal  on 27/12/2023.
//

import SwiftUI

struct SearchResultsView: View {
    @ObservedObject var networkManger:NetworkManger
    init(){
        networkManger = NetworkManger.shared
    }
    var body: some View {
        List{
            ForEach(networkManger.searchResult?.data ?? [],id:\.self){song in
                Text(song.preview)
            }
            
        }
    }
}
#Preview {
    SearchResultsView()
}