//
//  RMCharacterDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Ramazan Abdulaev on 07.01.2023.
//

import UIKit

final class RMCharacterDetailViewViewModel {
    
    // MARK: - Public properties
    public var title: String {
        return character.name.uppercased()
    }
    
    enum SectionType {
        case photo(viewModel: RMCharacterPhotoCollectionViewCellViewModel)
        
        case information(viewModels: [RMCharacterInfoCollectionViewCellViewModel])
        
        case episodes(viewModels: [RMCharacterEpisodeCollectionViewCellViewModel])
    }
    
    public var sections: [SectionType] = []
   
    // MARK: - Private properties
    private let character: RMCharacterModel
    
    private var requestUrl: URL? {
        return URL(string: character.url)
    }
    
    
    // MARK: - init
    init(character: RMCharacterModel) {
        self.character = character
        setupSections()
    }
    
    // MARK: - Private methods
    
    private func setupSections() {
        sections = [
            .photo(viewModel: .init()),
            .information(viewModels: [
                .init(),
                .init(),
                .init(),
                .init(),
            ]),
            .episodes(viewModels: [
                .init(),
                .init(),
                .init(),
            ])
        ]
    }
    
    // MARK: - Public methods
    public func createPhotoLayout() -> NSCollectionLayoutSection? {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(widthDimension: .fractionalWidth(1.0),
                              heightDimension: .fractionalHeight(1.0))
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(widthDimension: .fractionalWidth(1.0),
                              heightDimension: .fractionalHeight(0.5)),
            subitems: [item]
        )
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets.bottom = 8
        return section
    }
    
    public func createInformationLayout() -> NSCollectionLayoutSection? {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(widthDimension: .fractionalWidth(0.5),
                              heightDimension: .fractionalHeight(1)))
        item.contentInsets = .init(top: 0, leading: 0, bottom: 2, trailing: 2)
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(widthDimension: .fractionalWidth(1.0),
                              heightDimension: .estimated(150)),
            subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 2, leading: 2, bottom: 2, trailing: 0)
        section.orthogonalScrollingBehavior = .none
        return section
    }
    
    public func createEpisodesLayout() -> NSCollectionLayoutSection? {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(widthDimension: .fractionalWidth(1.0),
                              heightDimension: .fractionalHeight(1.0)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 8)
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(widthDimension: .fractionalWidth(0.85),
                              heightDimension: .estimated(150)),
            subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 8, leading: 8, bottom: 8, trailing: 8)
        section.supplementariesFollowContentInsets = true
        section.orthogonalScrollingBehavior = .groupPagingCentered
        return section
    }
  
}
