//
//  MovieModel.swift
//  MediaMixer
//
//  Created by asmaa gamal  on 09/01/2024.
//

import Foundation
struct MovieModel:Codable,Hashable{

    let id:String
    let title:String?
    let description:String?
    let image:String?
    let genre: [String]

}
