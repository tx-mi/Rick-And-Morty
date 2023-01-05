//
//  RMSingleLocation.swift
//  RickAndMorty
//
//  Created by Ramazan Abdulaev on 05.01.2023.
//

import Foundation

/// Name and link to the character's last known location endpoint.
struct RMSingleLocationModel: Codable {
    let name: String
    let url: String
}
