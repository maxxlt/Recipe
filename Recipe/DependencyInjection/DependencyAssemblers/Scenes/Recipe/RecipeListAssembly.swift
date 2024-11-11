//
//  RecipeListAssembly.swift
//  Recipe
//
//  Created by Max Chan on 11/11/24.
//

import Swinject

final class RecipeListAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(RecipeListViewModel.self) { resolver in
            guard let repo = resolver.resolve(RecipeRepository.self)
            else {
                fatalError("Recipe list dependencies could not be resolved")
            }
            
            return RecipeListViewModel(repo: repo)
        }
    }
    
}
