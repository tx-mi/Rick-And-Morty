//
//  RMGetAllCharactersResponse.swift
//  RickAndMorty
//
//  Created by Ramazan Abdulaev on 06.01.2023.
//

import Foundation

struct RMGetAllCharactersResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    let info: Info
    let results: [RMCharacterModel]
}
