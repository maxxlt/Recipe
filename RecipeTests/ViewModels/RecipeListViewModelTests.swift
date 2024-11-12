//
//  RecipeListViewModelTests.swift
//  RecipeListViewModelTests
//
//  Created by Max Chan on 11/11/24.
//

import XCTest
@testable import Recipe

final class RecipeListViewModelTests: XCTestCase {
    var viewModel: RecipeListViewModel!
    var mockRepository: MockRecipeRepository!
    
    override func setUpWithError() throws {
        mockRepository = MockRecipeRepository()
        viewModel = RecipeListViewModel(repo: mockRepository)
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
        mockRepository = nil
    }
    
    func testLoadRecipesSuccess() async throws {
        // Given
        let mockRecipes = [
            Recipe(id: "1", name: "Test Recipe 1", photoUrlSmall: "url1", photoUrlLarge: nil, cuisine: "Mexican"),
            Recipe(id: "2", name: "Test Recipe 2", photoUrlSmall: "url2", photoUrlLarge: nil, cuisine: "Italian")
        ]
        mockRepository.mockRecipes = mockRecipes
        mockRepository.shouldSucceed = true
        
        // When
        await viewModel.loadRecipes(withIndicator: true)
        
        // Then
        XCTAssertEqual(viewModel.recipes.count, 2)
        XCTAssertEqual(viewModel.recipes[0].id, mockRecipes[0].id)
        XCTAssertEqual(viewModel.recipes[1].name, mockRecipes[1].name)
        
        if case .done = viewModel.state {
            // State is correct
        } else {
            XCTFail("State should be .done")
        }
    }
    
    func testLoadRecipesFailure() async throws {
        // Given
        mockRepository.shouldSucceed = false
        
        // When
        await viewModel.loadRecipes(withIndicator: true)
        
        // Then
        XCTAssertEqual(viewModel.recipes.count, 0)
        
        if case .error = viewModel.state {
            // State is correct
        } else {
            XCTFail("State should be .error")
        }
    }
    
    func testLoadingState() async throws {
        // Given
        let expectation = XCTestExpectation(description: "Loading state should be set")
        
        // When
        Task {
            if case .loading(withIndicator: true) = viewModel.state {
                expectation.fulfill()
            }
            await viewModel.loadRecipes(withIndicator: true)
        }
        
        // Then
        await fulfillment(of: [expectation], timeout: 1.0)
    }
}
