//
//  FavView.swift
//  MediaMixer
//
//  Created by asmaa gamal  on 03/01/2024.
//

import SwiftUI

struct FavView: View {
    @ObservedObject var dataManger:DataManger
    init(){
        dataManger = DataManger.shared
    }
    var body: some View {
        List{
            ForEach(dataManger.favs , id:\.self){fav in
                
                Text(fav.url ?? "")
            }
        }
    }
}

#Preview {
    FavView()
}
