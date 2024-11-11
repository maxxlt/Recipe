//
//  RepositoryAssembly.swift
//  Recipe
//
//  Created by Max Chan on 11/11/24.
//

import Swinject

final class RepositoryAssembly: Assembly {

    func assemble(container: Container) {
        container.register(RecipeRepository.self) { _ in
            return RecipeService()
        }
    }

}
