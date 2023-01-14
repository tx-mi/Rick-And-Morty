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
        static let verticalInset: CGFloat = 8
        static let horizontalInset: CGFloat = 8
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let titleContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .tertiarySystemBackground
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubviews(titleContentView, titleLabel, valueLabel, iconImageView)
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Overrides
    override func prepareForReuse() {
        super.prepareForReuse()
        valueLabel.text = ""
        
        titleLabel.text = ""
        titleLabel.textColor = .label
        
        iconImageView.tintColor = .label
        iconImageView.image = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 8
        layoutIfNeeded()
    }
    
    // MARK: - Private methods
    private func makeConstraints() {
        // ContentView
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        // Title contentView
        NSLayoutConstraint.activate([
            titleContentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleContentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleContentView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            titleContentView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1/3)
        ])
        
        // Title Label
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: titleContentView.leadingAnchor,
                                                constant: Constants.horizontalInset),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: titleContentView.trailingAnchor,
                                                 constant: -Constants.horizontalInset),
            titleLabel.centerYAnchor.constraint(equalTo: titleContentView.centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: titleContentView.centerXAnchor),
        ])
        
        // IconImageView
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                   constant: Constants.horizontalInset),
            iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            iconImageView.bottomAnchor.constraint(equalTo: titleContentView.topAnchor),
            iconImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1/5)
        ])

        // Value Label
        NSLayoutConstraint.activate([
            valueLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            valueLabel.leadingAnchor.constraint(greaterThanOrEqualTo: iconImageView.trailingAnchor,
                                                constant: Constants.horizontalInset),
            valueLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor,
                                                 constant: -Constants.horizontalInset),
            valueLabel.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor),
            valueLabel.bottomAnchor.constraint(lessThanOrEqualTo: titleContentView.topAnchor),
            valueLabel.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor),
        ])
    }
    
    // MARK: - Public methods
    public func configure(with viewModel: RMCharacterInfoCollectionViewCellViewModel) {
        titleLabel.text = viewModel.titleDisplay
        valueLabel.text = viewModel.valueDisplay
        iconImageView.image = viewModel.iconImage
        titleLabel.textColor = viewModel.tintColor
        iconImageView.tintColor = viewModel.tintColor
    }
}
