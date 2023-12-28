//
//  NetworkManger.swift
//  MediaMixer
//
//  Created by asmaa gamal  on 27/12/2023.
//

import Foundation
class NetworkManger:ObservableObject{
    @Published var searchResult: SearchModel?
    static let shared = NetworkManger()
    private init(){}
    
    func search(query:String){
       
        let url = "https://api.deezer.com/search?q=\(query)"
        let decoder = JSONDecoder()
        APIManger.shared.getRequest(url: url) { data in
            if let jsonData = data {
                
                do {
                    let result = try decoder.decode(SearchModel.self, from:jsonData )
                    DispatchQueue.main.sync{
                        self.searchResult = result
                    }
                   
                }catch{
                    print(error)
                    
                }
            }
        }
    }
}
