//
//  ImageLoader.swift
//  MediaMixer
//
//  Created by asmaa gamal  on 28/12/2023.
//


import Foundation
import SwiftUI
class ImageLoader {
    static func loadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }

        URLSession.shared.downloadTask(with: url) { localURL, response, error in
            guard let localURL = localURL, error == nil else {
                completion(nil)
                return
            }

            do {
                let imageData = try Data(contentsOf: localURL)
                if let uiImage = UIImage(data: imageData) {

                        completion(uiImage)

                } else {
                    completion(nil)
                }
            } catch {
                print("Error loading image:", error)
                completion(nil)
            }
        }.resume()
    }
}
