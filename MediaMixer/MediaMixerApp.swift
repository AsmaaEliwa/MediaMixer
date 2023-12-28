//
//  MediaMixerApp.swift
//  MediaMixer
//
//  Created by asmaa gamal  on 27/12/2023.
//

import SwiftUI

@main
struct MediaMixerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            NavigationStack{
                HomeView()
            }
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
