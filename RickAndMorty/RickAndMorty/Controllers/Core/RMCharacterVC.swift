//
//  RMCharacterVC.swift
//  RickAndMorty
//
//  Created by Ramazan Abdulaev on 05.01.2023.
//

import UIKit

/// Controller to show and search for characters
class RMCharacterVC: UIViewController {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    private let characterListView = RMCharacterListView()
    
    // MARK: - Lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Characters"
        view.backgroundColor = .systemBackground
        
        characterListView.delegate = self
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

// MARK: - RMCharacterListViewDelegate
extension RMCharacterVC: RMCharacterListViewDelegate {
    
    func rmCharacterListView(_ characterListView: RMCharacterListView, didSelectCharacter character: RMCharacterModel) {
        // Open detail controller for that character
        print("push detail vc")
    }
    
}
