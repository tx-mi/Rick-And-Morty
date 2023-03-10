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
    
    public var episodes: [String] {
        character.episode
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
            .photo(viewModel: .init(imageUrl: URL(string: character.image))),
            .information(viewModels: [
                .init(value: character.status.text, title: .status),
                .init(value: character.gender.rawValue, title: .gender),
                .init(value: character.type, title: .type),
                .init(value: character.species, title: .species),
                .init(value: character.origin.name, title: .origin),
                .init(value: character.location.name, title: .location),
                .init(value: character.created, title: .created),
                .init(value: "\(character.episode.count)", title: .totalEpisodes),
            ]),
            .episodes(viewModels: character.episode.compactMap({
                return RMCharacterEpisodeCollectionViewCellViewModel(episodeDataUrl: URL(string: $0))
            }))
        ]
    }
    
    // MARK: - Public methods
    public func createPhotoLayout() -> NSCollectionLayoutSection? {
        let inset: CGFloat = 8
        let item = NSCollectionLayoutItem(
            layoutSize: .init(widthDimension: .fractionalWidth(1.0),
                              heightDimension: .fractionalHeight(1.0))
        )
        item.contentInsets = .init(top: 0, leading: inset, bottom: 0, trailing: inset)
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(widthDimension: .fractionalWidth(1.0),
                              heightDimension: .fractionalHeight(0.6)),
            subitems: [item]
        )
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets.bottom = 8
        return section
    }
    
    public func createInformationLayout() -> NSCollectionLayoutSection? {
        let inset: CGFloat = 8
        let item = NSCollectionLayoutItem(
            layoutSize: .init(widthDimension: .fractionalWidth(0.5),
                              heightDimension: .fractionalHeight(1)))
        item.contentInsets = .init(top: 0, leading: 0, bottom: inset, trailing: inset)
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(widthDimension: .fractionalWidth(1.0),
                              heightDimension: .estimated(150)),
            subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: inset, leading: inset, bottom: inset, trailing: 0)
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
