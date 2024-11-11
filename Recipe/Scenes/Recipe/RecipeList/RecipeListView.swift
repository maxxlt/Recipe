//
//  RecipeListView.swift
//  Recipe
//
//  Created by Max Chan on 11/11/24.
//

import Combine
import UIKit

class RecipeListView: UIView {

    enum State {
        case loading(withIndicator: Bool), done, error
    }

    // MARK: - Public vars
    var actionPublisher = PassthroughSubject<Action, Never>()
    var state: State = .loading(withIndicator: true) {
        didSet {
            switch self.state {
                case .loading(let withIndicator): 
                    print("Loading")
                case .done: 
                    print("Done")
                case .error:
                    print("Error")
            }
        }
    }
    
    // MARK: - Inits
    init() {
        super.init(frame: .zero)
        setup()
    }
    required init?(coder: NSCoder) { nil }
    
    private func setup() {
        backgroundColor = .red
        constrain()
    }
    
    private func constrain(){
        
    }
    
    // MARK: - Private vars
    
    // MARK: - Private methods
    
    // MARK: - Lazy Loads
}

extension RecipeListView {
    enum Action {
        
    }
}
