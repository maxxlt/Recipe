//
//  DIContainer.swift
//  Recipe
//
//  Created by Max Chan on 11/11/24.
//

import Swinject

final class DIContainer {
    static let shared = DIContainer()

    let container: Container = Container()
    let assembler: Assembler

    init() {
        assembler = Assembler(
            [
                RepositoryAssembly(),
                SceneAssembly()
            ],
            container: container
        )
    }

    func resolve<T>() -> T {
        guard let resolvedType = container.resolve(T.self) else {
            fatalError()
        }
        return resolvedType
    }

    func resolve<T, Arg>(argument: Arg) -> T {
        guard let resolvedType = container.resolve(T.self, argument: argument)
        else {
            fatalError()
        }
        return resolvedType
    }

    func resolve<T, Arg1, Arg2>(arguments arg1: Arg1, _ arg2: Arg2) -> T {
        guard
            let resolvedType = container.resolve(T.self, arguments: arg1, arg2)
        else {
            fatalError()
        }
        return resolvedType
    }

}
