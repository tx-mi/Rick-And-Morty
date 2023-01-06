//
//  CharacterListViewViewModel.swift
//  RickAndMorty
//
//  Created by Ramazan Abdulaev on 06.01.2023.
//

import UIKit
protocol RMCharacterListViewViewModelDelegate: AnyObject {
    func didLoadInitialCharacters()
    func didSelectCharacter(_ character: RMCharacterModel)
}

/// ViewModel to handle character list view logic
final class RMCharacterListViewViewModel: NSObject {
    
    // MARK: - Public properties
    public var shouldShowLoadMoreIndicators: Bool {
        return apiInfo?.next != nil
    }
    
    // MARK: - Private properties
    public weak var delegate: RMCharacterListViewViewModelDelegate?
    
    // MARK: - Private properties
    private enum Constants {
        enum Insets {
            static let vertical: CGFloat = 0
            static let horizontal: CGFloat = 16
        }
    }
   
    private var apiInfo: RMGetAllCharactersResponse.Info? = nil
    
    private var characters: [RMCharacterModel] = [] {
        didSet {
            for character in characters {
                let viewModel = RMCharacterCollectionViewCellViewModel(
                    characterName: character.name,
                    characterStatus: character.status,
                    characterImageUrl: URL(string: character.image)
                )
                cellViewModels.append(viewModel)
            }
        }
    }
    
    private var cellViewModels: [RMCharacterCollectionViewCellViewModel] = []
    
    // MARK: - Public methods
    
    /// Fetch inital set of characters(20)
    public func fetchCharacters() {
        RMService.shared.execute(
            .listCharactersRequest,
            expecting: RMGetAllCharactersResponse.self
        ) { [weak self] result in
            switch result {
            case .success(let responseModel):
                let results = responseModel.results
                let info = responseModel.info
                self?.characters = results
                self?.apiInfo = info
                DispatchQueue.main.async {
                    self?.delegate?.didLoadInitialCharacters()
                }
                
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
    /// Paginate if additional characters are needed
    public func fetchAdditionalCharacters() {
        // TODO: Fetch characters
    }
    
}

// MARK: - CollectionView Delegates
extension RMCharacterListViewViewModel: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RMCharacterCollectionViewCell.cellIdendifier,
            for: indexPath) as? RMCharacterCollectionViewCell
        else { fatalError("Unsupported cell") }
        cell.configure(with: cellViewModels[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - Constants.Insets.horizontal * 3) / 2
        return CGSize(width: width, height: width * 1.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(
            top: Constants.Insets.vertical,
            left: Constants.Insets.horizontal,
            bottom: Constants.Insets.vertical,
            right: Constants.Insets.horizontal
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        delegate?.didSelectCharacter(characters[indexPath.row])
    }
    
}

// MARK: - ScrollView Delegates
extension RMCharacterListViewViewModel: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard shouldShowLoadMoreIndicators else { return }
        fetchAdditionalCharacters()
    }
    
}
