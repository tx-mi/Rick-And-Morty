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
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubviews(titleLabel, valueLabel)
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Overrides
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = ""
        valueLabel.text = ""
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.cornerRadius = 8
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
        
        // Title Label
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                constant: Constants.horizontalInset),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                 constant: -Constants.horizontalInset),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor,
                                            constant: Constants.verticalInset),
        ])
        
        // Value Label
        NSLayoutConstraint.activate([
            valueLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                 constant: Constants.horizontalInset),
            valueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                 constant: -Constants.horizontalInset),
            valueLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.verticalInset),
        ])
    }
    
    // MARK: - Public methods
    public func configure(with viewModel: RMCharacterInfoCollectionViewCellViewModel) {
        titleLabel.text = viewModel.titleString
        valueLabel.text = viewModel.valueString
    }
}
