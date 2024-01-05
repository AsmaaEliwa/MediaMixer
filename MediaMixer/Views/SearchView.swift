//
//  SearchView.swift
//  MediaMixer
//
//  Created by asmaa gamal  on 03/01/2024.
//

import SwiftUI

struct SearchView: View {
    @State var selectedView = 0
    var body: some View {
        TabView(selection: $selectedView,
                content:  {
            HomeView().tabItem { Image(systemName: "house") }.tag(0)
            FavView().tabItem { Image(systemName: "bookmark.circle.fill") }.tag(1)
        })
    }
}

#Preview {
    SearchView()
}
