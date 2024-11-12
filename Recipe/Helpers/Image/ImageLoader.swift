//
//  ImageLoader.swift
//  Recipe
//
//  Created by Max Chan on 11/11/24.
//

import SwiftUI

actor ImageLoader {
    static let shared = ImageLoader()
    private var loadingTasks: [URL: Task<UIImage, Error>] = [:]
    
    private let cache = ImageCache.shared
    
    func loadImage(from url: URL) async throws -> UIImage {
        if let cachedImage = await cache.get(url) {
            return cachedImage
        }
        
        if let existingTask = loadingTasks[url] {
            return try await existingTask.value
        }
        
        let task = Task<UIImage, Error> {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200,
                  let image = UIImage(data: data) 
            else { throw RecipeErrors.apiError }
            
            await cache.insert(image, for: url)
            return image
        }
        
        loadingTasks[url] = task
        
        do {
            let image = try await task.value
            loadingTasks[url] = nil
            return image
        } catch {
            loadingTasks[url] = nil
            throw error
        }
    }
    
    func cancelLoading(for url: URL) {
        loadingTasks[url]?.cancel()
        loadingTasks[url] = nil
    }
}
