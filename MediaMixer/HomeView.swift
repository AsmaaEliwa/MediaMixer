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
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        VStack{
            HStack{
                TextField(" Enter Song", text: $query).frame(width: 300,height: 40).border(.gray)
                Button{
                    NetworkManger.shared.search(query:query )
                    isSearching = true
                }label: {
                    Image(systemName: "magnifyingglass").frame(width: 30,height: 40)
                }
            }.padding()
            NavigationLink(destination:SearchResultsView(),isActive: $isSearching ){
                EmptyView()
            }
        }
    }
}

#Preview {
    HomeView()
}
