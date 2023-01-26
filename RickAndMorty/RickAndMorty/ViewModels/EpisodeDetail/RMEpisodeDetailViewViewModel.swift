//
//  RMEpisodeDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Ramazan Abdulaev on 26.01.2023.
//

import Foundation

final class RMEpisodeDetailViewViewModel {
    
    // MARK: - Private properties
    private let endpointURL: URL?
    
    // MARK: - Init
    init(endpointURL: URL?) {
        self.endpointURL = endpointURL
        fetchEpisodeData()
    }
    
    // MARK: - Private methods
    private func fetchEpisodeData() {
        guard let url = endpointURL,
              let request = RMRequest(url: url)
        else {
            return
        }
        RMService.shared.execute(
            request,
            expecting: RMEpisodeModel.self)
        { resuts in
            switch resuts {
            case .success(let success):
                print(String(describing: success))
            case .failure:
                break
            }
        }
    }
    
}
