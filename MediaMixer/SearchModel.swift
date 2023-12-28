//
//  SearchModel.swift
//  MediaMixer
//
//  Created by asmaa gamal  on 27/12/2023.
//

import Foundation
struct SearchModel:Codable,Hashable{
let data:[DataModel]
}
struct DataModel:Codable,Hashable{
    static func == (lhs: DataModel, rhs: DataModel) -> Bool {
        lhs.id == rhs.id
    }
    
    let id:Int
    let title:String
    let link:String
    let preview:String
    let artist:artistModel
    let album:albumModel
}
struct artistModel:Codable,Hashable{
    let id:Int
    let name:String
    let picture_small:String
}
struct albumModel:Codable, Hashable{
    let cover_small:String
}
