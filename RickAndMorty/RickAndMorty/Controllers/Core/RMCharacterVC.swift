//
//  RMCharacterVC.swift
//  RickAndMorty
//
//  Created by Ramazan Abdulaev on 05.01.2023.
//

import UIKit

/// Controller to show and search for characters
class RMCharacterVC: UIViewController {
    
    // MARK: - Private properties
    private let characterListView = CharacterListView()
    
    // MARK: - Public properties
    // MARK: - Lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Characters"
        view.backgroundColor = .systemBackground
        
        view.addSubview(characterListView)
        makeConstraints()
    }
    
    // MARK: - Private methods
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            characterListView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            characterListView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
