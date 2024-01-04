//
//  FavSong+CoreDataProperties.swift
//  MediaMixer
//
//  Created by asmaa gamal  on 03/01/2024.
//
//

import Foundation
import CoreData


extension FavSong {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavSong> {
        return NSFetchRequest<FavSong>(entityName: "FavSong")
    }

    @NSManaged public var url: String?

}

extension FavSong : Identifiable {

}
