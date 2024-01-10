//
//  HomeView.swift
//  MediaMixer
//
//  Created by asmaa gamal  on 27/12/2023.
//

import SwiftUI

struct HomeView: View {
    @State var query:String = ""
    @State var isSearching = false
    var networkManager: NetworkManaging?
    var body: some View {

        
        VStack{
                    Label("Welcome back", systemImage: "music.quarternote.3").shadow(color: .blue ,radius: 10).font(.system(size: 25))
            HStack{
                TextField(" Enter Song", text: $query).padding().frame(width: 300,height: 40).border(.blue)
                Button{
                    do {
                        try
                        NetworkManger.shared.search(query:query )
                    }catch {
                        print(error)
                    }
                  
                    isSearching = true
                }label: {
                    Image(systemName: "magnifyingglass").frame(width: 40,height: 40)
                }
            }.padding()
            NavigationLink(destination:SearchResultsView(),isActive: $isSearching ){
                EmptyView()
            }
        }
    }
}
//
//#Preview {
//    HomeView()
//}
