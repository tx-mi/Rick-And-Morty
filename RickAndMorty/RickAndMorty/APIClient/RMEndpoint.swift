//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by Ramazan Abdulaev on 05.01.2023.
//

import Foundation


@frozen
/// Represent unique API endpoint
enum RMEndpoint: String {
    case character
    case episode
    case location
}
