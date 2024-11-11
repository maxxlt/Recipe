//
//  RecipeListViewController.swift
//  Recipe
//
//  Created by Max Chan on 11/11/24.
//

import Combine
import UIKit

class RecipeListViewController: UIViewController {
    
    var viewModel: RecipeListViewModel?
    
    // MARK: - Inits
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) { nil }
    
    // MARK: - Overrides
    override func loadView() {
        view = customView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }
    
    // MARK: - Private vars
    private var observables = Set<AnyCancellable>()
    
    // MARK: - Private methods
    private func setupBindings() {
        observables = [
            customView.actionPublisher
                .receive(on: DispatchQueue.main)
                .sink { [weak self] action in
                    
                }
        ]
    }
    
    // MARK: - Lazy vars
    private lazy var customView = RecipeListView()
}
