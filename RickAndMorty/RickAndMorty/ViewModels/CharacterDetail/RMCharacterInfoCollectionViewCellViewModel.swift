//
//  RMCharacterInfoCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Ramazan Abdulaev on 08.01.2023.
//

import UIKit

final class RMCharacterInfoCollectionViewCellViewModel {
    
    // MARK: - Public properties
    
    public var titleDisplay: String {
        return title.text
    }
    
    public var valueDisplay: String {
        if value.isEmpty {
            return "None"
        }
        switch title {
        case .created:
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            guard let date = dateFormatter.date(from: value) else { return value }
            dateFormatter.dateFormat = "MMMM d, yyyy"
            let dateString = dateFormatter.string(from: date)
            return dateString
        default:
            return value
        }
    }
    
    public var iconImage: UIImage? {
        switch title {
        case .status:
            return UIImage(systemName: "bell")
        case .gender:
            return UIImage(systemName: "person")
        case .type:
            return UIImage(systemName: "leaf")
        case .species:
            return UIImage(systemName: "pawprint")
        case .location:
            return UIImage(systemName: "globe.americas")
        case .origin:
            return UIImage(systemName: "globe.americas")
        case .created:
            return UIImage(systemName: "calendar")
        case .totalEpisodes:
            return UIImage(systemName: "tv.circle")
        }
    }
    
    public var tintColor: UIColor {
        switch title {
        case .status:
            return .systemBlue
        case .gender:
            return .systemPurple
        case .type:
            return .systemYellow
        case .species:
            return .systemRed
        case .location:
            return .systemGreen
        case .origin:
            return .systemBrown
        case .created:
            return .systemPink
        case .totalEpisodes:
            return .systemOrange
        }
    }
    
    enum TitleType: String {
        case status
        case gender
        case type
        case species
        case location
        case origin
        case created
        case totalEpisodes = "Total Episodes"
        
        var text: String {
            return self.rawValue.uppercased()
        }
    }
    
    // MARK: - Private properties
    private let value: String
    
    public let title: TitleType
    
    // MARK: - Init
    init(value: String, title: TitleType) {
        self.value = value
        self.title = title
    }
    
}
