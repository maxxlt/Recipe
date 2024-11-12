//
//  RecipeListViewModel.swift
//  Recipe
//
//  Created by Max Chan on 11/11/24.
//

import SwiftUI

class RecipeListViewModel: ObservableObject {
    
    // MARK: - Public
    @MainActor func loadRecipes(withIndicator: Bool) async {
        self.state = .loading(withIndicator: withIndicator)
        do {
            let recipes = try await repo.getRecipes()
            self.recipes = recipes
            self.state = .done
        } catch {
            print(error)
            self.state = .error
        }
    }
    
    // MARK: - Published
    @Published private(set) var state: RecipeListView.State = .loading(withIndicator: true)
    @Published private(set) var recipes = [Recipe]()
    
    // MARK: - Inits
    init(repo: RecipeRepository) {
        self.repo = repo
    }
    
    // MARK: - Private
    private let repo: RecipeRepository
}
