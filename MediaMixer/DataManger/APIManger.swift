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
    
}
