//
//  RecipeListView.swift
//  Recipe
//
//  Created by Max Chan on 11/11/24.
//

import SwiftUI

struct RecipeListView: View {
    
    enum State {
        case loading(withIndicator: Bool), done, error
    }
    
    @StateObject private var viewModel: RecipeListViewModel
    
    init() {
        _viewModel = StateObject(
            wrappedValue: DIContainer.shared.resolve()
        )
    }
    
    var body: some View {
        VStack(spacing: 8) {
            switch viewModel.state {
                case .loading(let withIndicator):
                    if (withIndicator) {
                        ProgressView()
                    }
                case .error:
                    Text("Something went wrong. Please try again.")
                    Button("Try Again") {
                        Task {
                            await viewModel.loadRecipes(withIndicator: true)
                        }
                    }
                case .done:
                    if viewModel.recipes.count > 0 {
                        List(viewModel.recipes) { recipe in
                            Text("\(recipe.name)")
                        }
                        .refreshable {
                            await viewModel.loadRecipes(withIndicator: false)
                        }
                    } else {
                        Text("There are no recipes available yet")
                    }
            }
        }
        .task {
            await viewModel.loadRecipes(withIndicator: true)
        }
    }
}
