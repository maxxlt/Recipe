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
    @Published private(set) var state: RecipeListView.State = .loading
    
    // MARK: - Inits
    init() {}
}
