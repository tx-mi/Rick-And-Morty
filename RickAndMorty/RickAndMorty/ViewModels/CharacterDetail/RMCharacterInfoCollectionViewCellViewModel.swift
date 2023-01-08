//
//  RMCharacterInfoCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Ramazan Abdulaev on 08.01.2023.
//

import Foundation

final class RMCharacterInfoCollectionViewCellViewModel {
    
    // MARK: - Public properties
    
    public var titleString: String {
        return title.text
    }
    
    public var valueString: String {
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
            return self.rawValue.capitalized
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
