//
//  ImageCache.swift
//  Recipe
//
//  Created by Max Chan on 11/11/24.
//

import SwiftUI

actor ImageCache {
    static let shared = ImageCache()
    
    private var memoryCache: [URL: UIImage] = [:]
    private let fileManager = FileManager.default
    private let cacheDirectory: URL
    
    init() {
        let paths = fileManager.urls(for: .cachesDirectory, in: .userDomainMask)
        cacheDirectory = paths[0].appendingPathComponent("ImageCache")
        
        try? fileManager.createDirectory(
            at: cacheDirectory,
            withIntermediateDirectories: true
        )
    }
    
    private func cacheFileURL(for url: URL) -> URL {
        let fileName = "\(url.absoluteString.hash).cache"
        return cacheDirectory.appendingPathComponent(fileName)
    }
    
    func insert(_ image: UIImage, for url: URL) {
        memoryCache[url] = image
        
        Task.detached(priority: .background) {
            if let data = image.jpegData(compressionQuality: 0.8) {
                let fileURL = await self.cacheFileURL(for: url)
                try? data.write(to: fileURL)
            }
        }
    }
    
    func get(_ url: URL) async -> UIImage? {
        if let image = memoryCache[url] {
            return image
        }
        
        let fileURL = cacheFileURL(for: url)
        guard let data = try? Data(contentsOf: fileURL),
              let image = UIImage(data: data) else {
            return nil
        }
        
        memoryCache[url] = image
        return image
    }
    
    func removeCache(for url: URL) {
        memoryCache[url] = nil
        
        let fileURL = cacheFileURL(for: url)
        try? fileManager.removeItem(at: fileURL)
    }
    
    func clearCache() {
        memoryCache.removeAll()
        
        try? fileManager.removeItem(at: cacheDirectory)
        try? fileManager.createDirectory(
            at: cacheDirectory,
            withIntermediateDirectories: true
        )
    }
}
