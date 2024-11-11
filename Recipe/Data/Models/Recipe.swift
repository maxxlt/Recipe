//
//  Recipe.swift
//  Recipe
//
//  Created by Max Chan on 11/11/24.
//

import Foundation

struct Recipe: Codable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case id = "uuid",
             name,
             photoUrlSmall = "photo_url_small",
             photoUrlLarge = "photo_url_large",
             cuisine
    }
    
    let id: String
    let name: String
    let photoUrlSmall: String?
    let photoUrlLarge: String?
    let cuisine: String
}

struct Recipes: Codable {
    let recipes: [Recipe]
}
