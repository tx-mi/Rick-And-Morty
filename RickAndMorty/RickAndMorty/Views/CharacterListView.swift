//
//  CharacterListView.swift
//  RickAndMorty
//
//  Created by Ramazan Abdulaev on 06.01.2023.
//

import UIKit

/// View that handles showing list of character, loader, etc.
final class CharacterListView: UIView {

    // MARK: - Private properties
    private let viewModel = CharacterListViewViewModel()
    
    private lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.alpha = 0
        collectionView.isHidden = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = viewModel
        collectionView.delegate = viewModel
        collectionView.register(UICollectionViewCell.self,
                                forCellWithReuseIdentifier: "cell")
        return collectionView
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubviews(collectionView, spinner)
        makeConstraints()
       
        // For test
        spinner.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.spinner.stopAnimating()
            self.spinner.isHidden = true
            self.collectionView.isHidden = false
            UIView.animate(withDuration: 0.4) {
                self.collectionView.alpha = 1
            }
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    private func makeConstraints() {
        // Spinner
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        // Collection View
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

}
