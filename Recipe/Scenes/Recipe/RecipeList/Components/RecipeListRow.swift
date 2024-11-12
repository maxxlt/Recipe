//
//  RecipeListRow.swift
//  Recipe
//
//  Created by Max Chan on 11/11/24.
//

import SwiftUI

struct RecipeListRow: View {
    let recipe: Recipe
    @State private var image: UIImage?
    @State private var loadingTask: Task<Void, Never>?
    
    var body: some View {
        HStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            } else {
                ProgressView()
                    .frame(width: 50, height: 50)
            }
            
            VStack(alignment: .leading) {
                Text(recipe.name)
                    .fontWeight(.bold)
                Text(recipe.cuisine)
            }
        }
        .onAppear {
            loadImage()
        }
        .onDisappear {
            loadingTask?.cancel()
        }
    }
    
    // MARK: - Private
    private func loadImage() {
        guard let imageUrlStr = recipe.photoUrlSmall,
              let imageUrl = URL(string: imageUrlStr)
        else { return }
        
        loadingTask?.cancel()
        
        loadingTask = Task {
            do {
                let loadedImage = try await ImageLoader.shared.loadImage(
                    from: imageUrl
                )
                if !Task.isCancelled {
                    await MainActor.run {
                        self.image = loadedImage
                    }
                }
            } catch {
                print("Error loading image: \(error)")
            }
        }
    }
}
