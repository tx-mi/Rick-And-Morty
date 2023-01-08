//
//  RMCharacterInfoCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Ramazan Abdulaev on 08.01.2023.
//

import UIKit

final class RMCharacterInfoCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "RMCharacterInfoCollectionViewCellIdentifier"
    // MARK: - Private properties
    private enum Constants {
    }
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Overrides
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.cornerRadius = 8
    }
    
    // MARK: - Private methods
    private func makeConstraints() {
    }
    
    // MARK: - Public methods
    public func configure(with viewModel: RMCharacterInfoCollectionViewCellViewModel) {
        
    }
}
