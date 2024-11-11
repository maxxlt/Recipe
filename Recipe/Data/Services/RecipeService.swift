//
//  RecipeService.swift
//  Recipe
//
//  Created by Max Chan on 11/11/24.
//

import Foundation

class RecipeService: RecipeRepository {
    func getRecipes() async throws -> [Recipe] {
        guard let url = URL(string: MALFORMED_JSON)
        else { throw RecipeErrors.invalidUrlError }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200
        else { throw RecipeErrors.apiError }
        
        guard let data = try? JSONDecoder().decode(Recipes.self, from: data)
        else { throw RecipeErrors.parsingError }
        
        return data.recipes
    }
}
