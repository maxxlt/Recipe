//
//  RecipeRepository.swift
//  Recipe
//
//  Created by Max Chan on 11/11/24.
//

import Foundation

enum RecipeErrors: Error {
    case invalidUrlError
    case parsingError
    case apiError
}

protocol RecipeRepository {
    func getRecipes() async throws -> [Recipe]
}
