//
//  DataManger.swift
//  MediaMixer
//
//  Created by asmaa gamal  on 03/01/2024.
//

import Foundation
import CoreData
class DataManger:ObservableObject{
   static  let  shared = DataManger()
    @Published var favs:[FavSong] = []
    private init(){
        fetchFav()
    }
    lazy var persistentContainer: NSPersistentContainer = {
           let container = NSPersistentContainer(name: "MediaMixer")
           container.loadPersistentStores { description, error in
               if let error = error {
                   fatalError("Unable to load persistent stores: \(error)")
               }else{
                   print("Loaded")
               }
           }
           return container
       }()
    
    
    func addToFav(song:DataModel){
        if let entity = NSEntityDescription.entity(forEntityName: "FavSong", in: persistentContainer.viewContext){
            
            let Favsong = NSManagedObject(entity: entity, insertInto: persistentContainer.viewContext)
            Favsong.setValue(song.preview, forKey: "url")
            
            do {
                
                
                try persistentContainer.viewContext.save()
                print("saved to favs")
                fetchFav()
                
            }catch {
                print(error)
                
            }
        }
    }

    
    func fetchFav(){
        let request:NSFetchRequest<FavSong> = FavSong.fetchRequest()
        do {
            let result = try persistentContainer.viewContext.fetch(request)
            favs = result
            
        }catch {
            print(error)
        }
    }
    
    
}
