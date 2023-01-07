//
//  RMCharacterDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Ramazan Abdulaev on 07.01.2023.
//

import Foundation

final class RMCharacterDetailViewViewModel {
    
    // MARK: - Public properties
    public var title: String {
        return character.name.uppercased()
    }
    
    // MARK: - Private properties
    private let character: RMCharacterModel
    
    // MARK: - init
    init(character: RMCharacterModel) {
        self.character = character
    }
    
    // MARK: - Private methods
    
    // MARK: - Public methods
    
}
