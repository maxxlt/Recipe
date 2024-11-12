import Foundation
@testable import Recipe

class MockRecipeRepository: RecipeRepository {
    var shouldSucceed = true
    var mockRecipes: [Recipe] = []
    
    func getRecipes() async throws -> [Recipe] {
        if shouldSucceed {
            return mockRecipes
        } else {
            throw NSError(domain: "MockError", code: -1)
        }
    }
} 
