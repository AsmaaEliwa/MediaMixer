//
//  ImageLoader.swift
//  MediaMixer
//
//  Created by asmaa gamal  on 28/12/2023.
//


import Foundation
import SwiftUI

class ImageLoader {
    static func loadImage(from urlString: String, completion: @escaping (Image?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let uiImage = UIImage(data: data) else {
                completion(nil)
                return
            }
            DispatchQueue.main.async {
                completion(Image(uiImage: uiImage))
            }
        }.resume()
    }
}
