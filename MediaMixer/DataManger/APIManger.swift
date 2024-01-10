//
//  APIManger.swift
//  MediaMixer
//
//  Created by asmaa gamal  on 27/12/2023.
//

import Foundation
class APIManger{
    static let shared = APIManger()
    private init(){}
    
    func getRequest(url:String , compilation:@escaping(Data?)->Void){
        guard let requestUrl = URL(string:url)else{return}
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "GET"
        request.timeoutInterval = 30.0
        request.cachePolicy = .useProtocolCachePolicy
        
        let task = URLSession.shared.dataTask(with: request ){data,respons,error in
            if data != nil {
                compilation(data)
            }else{
                compilation(nil)
            }
            
        }
        task.resume()
    }
    
    func getMovies(url:String , compilation:@escaping(Data?)->Void){
        guard let requestUrl = URL(string:url)else{return}
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "GET"
        request.timeoutInterval = 30.0
        request.cachePolicy = .useProtocolCachePolicy
        request.setValue("8a47dda633mshc50d0d1f4c16f9fp1cab33jsn7b7ecb0ee4a6", forHTTPHeaderField: "X-RapidAPI-Key")
        request.setValue("imdb-top-100-movies.p.rapidapi.com", forHTTPHeaderField: "X-RapidAPI-Host")
        let task = URLSession.shared.dataTask(with: request ){data,respons,error in
            if data != nil {
                compilation(data)
            }else{
                compilation(nil)
            }
            
        }
        task.resume()
    }
    
    
    
    
    
}
