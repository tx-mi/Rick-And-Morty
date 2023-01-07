//
//  RMCharacterCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Ramazan Abdulaev on 06.01.2023.
//

import UIKit

/// Single cell for a character
final class RMCharacterCollectionViewCell: UICollectionViewCell {
    static let cellIdendifier = "RMCharacterCollectionViewCellIdentifier"
    
    // MARK: - Private properties
    private enum Constants {
        enum LabelInsets {
            static let vertical: CGFloat = 8
            static let horizontal: CGFloat = 8
        }
    }
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubviews(imageView, nameLabel, statusLabel)
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Overrides
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        nameLabel.text = nil
        statusLabel.text = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutIfNeeded()
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 5
        contentView.layer.shadowColor = UIColor.secondaryLabel.cgColor
        contentView.layer.shadowRadius = 5
        contentView.layer.shadowOffset = CGSize(width: 5, height: 5)
        contentView.layer.shadowOpacity = 0.3
    }
    
    // MARK: - Private methods
    private func makeConstraints() {
        // Status Label
        NSLayoutConstraint.activate([
            statusLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                 constant: Constants.LabelInsets.horizontal),
            statusLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                  constant: -Constants.LabelInsets.horizontal),
            statusLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                                constant: -Constants.LabelInsets.vertical),
        ])
        
        // Name Label
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                 constant: Constants.LabelInsets.horizontal),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                  constant: -Constants.LabelInsets.horizontal),
            nameLabel.bottomAnchor.constraint(equalTo: statusLabel.topAnchor,
                                                constant: -Constants.LabelInsets.vertical),
        ])
        
        // Image View
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor,
                                              constant: -Constants.LabelInsets.vertical),
        ])
    }
    
    // MARK: - Public methods
    public func configure(with viewModel: RMCharacterCollectionViewCellViewModel) {
        nameLabel.text = viewModel.characterName
        statusLabel.text = viewModel.characterStatusText
        viewModel.fetchImage { [weak self] resutl in
            switch resutl {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.imageView.image = image
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}
