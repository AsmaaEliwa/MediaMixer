//
//  MovieView.swift
//  MediaMixer
//
//  Created by asmaa gamal  on 09/01/2024.
//

import SwiftUI

struct MovieView: View {
    let movie: MovieModel

    @State private var movieImage: UIImage?

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let movieImage = movieImage {
                Image(uiImage: movieImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 200)
                    .cornerRadius(8)
                    .shadow(radius: 4)
            }

            Text(movie.title ?? "")
                .font(.headline)
                .foregroundColor(.primary)

            Text(movie.description ?? "")
                .font(.subheadline)
                .foregroundColor(.secondary)

            HStack {
                ForEach(movie.genre, id: \.self) { genre in
                    Text(genre)
                        .font(.footnote)
                        .padding(6)
                        .background(Color.blue)
                        .cornerRadius(8)
                        .foregroundColor(.white)
                }
            }
        }
        .onAppear {
            if let imageUrl = movie.image {
                ImageLoader.loadImage(from: imageUrl) { image in
                    if let image = image {
                        movieImage = image
                    }
                }
            }
        }
        .padding()
    }
}

//#Preview {
//    MovieView()
//}
