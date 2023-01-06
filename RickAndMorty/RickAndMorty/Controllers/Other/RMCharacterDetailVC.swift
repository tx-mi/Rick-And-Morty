//
//  RMCharacterDetailVC.swift
//  RickAndMorty
//
//  Created by Ramazan Abdulaev on 07.01.2023.
//

import UIKit

final class RMCharacterDetailVC: UIViewController {

    // MARK: - Public properties
    
    // MARK: - Private properties
    private let viewModel: RMCharacterDetailViewViewModel
    
    // MARK: - Lyfecycle
    init(viewModel: RMCharacterDetailViewViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = viewModel.title
    }

    // MARK: - Private methods
}
