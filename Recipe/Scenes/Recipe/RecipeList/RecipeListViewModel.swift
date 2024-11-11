//
//  RecipeListViewModel.swift
//  Recipe
//
//  Created by Max Chan on 11/11/24.
//

import Combine

class RecipeListViewModel {
    
    // MARK: - Public vars
    
    // MARK: - Published vars
    @Published private(set) var state: RecipeListView.State = .loading(withIndicator: true)
    
    // MARK: - Inits
    init(repo: RecipeRepository) {
        self.repo = repo
    }
    
    // MARK: - Private
    private let repo: RecipeRepository
}
