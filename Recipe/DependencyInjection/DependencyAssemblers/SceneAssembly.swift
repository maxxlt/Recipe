//
//  SceneAssembly.swift
//  Recipe
//
//  Created by Max Chan on 11/11/24.
//

import Swinject

final class SceneAssembly: Assembly {

    func assemble(container: Container) {
        let assemblies: [Assembly] = [
            RecipeListAssembly()
        ]
        assemblies.forEach {
            $0.assemble(container: container)
        }
    }

}
