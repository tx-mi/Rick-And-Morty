//
//  CharacterListViewViewModel.swift
//  RickAndMorty
//
//  Created by Ramazan Abdulaev on 06.01.2023.
//

import UIKit

final class CharacterListViewViewModel: NSObject {
    
    private enum Constants {
        enum Insets {
            static let vertical: CGFloat = 0
            static let horizontal: CGFloat = 16
        }
    }
    
    func fetchCharacters() {
        RMService.shared.execute(.listCharactersRequest,
                                 expecting: RMGetAllCharactersResponse.self) { result in
            switch result {
            case .success(let model):
                print(String(describing: model))
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
}

extension CharacterListViewViewModel: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .systemGreen
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
    
}
