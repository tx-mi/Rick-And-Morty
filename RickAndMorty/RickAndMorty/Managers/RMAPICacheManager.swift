//
//  RMAPICacheManager.swift
//  RickAndMorty
//
//  Created by Ramazan Abdulaev on 15.01.2023.
//

import Foundation

final class RMAPICacheManager {
    
    // MARK: - Private properties
    private var chacheDictionary: [RMEndpoint: NSCache<NSString, NSData>] = [:]
    
    // MARK: - Init
    init() {
        setupCache()
    }
    
    // MARK: - Public methods
    public func chachedResponse(for endpoint: RMEndpoint, with url: URL?) -> Data? {
        guard let targetCache = chacheDictionary[endpoint], let url else {
            return nil
        }
        let key = url.absoluteString as NSString
        let data = targetCache.object(forKey: key) as? Data
        return data
    }
    
    public func setCache(for endpoint: RMEndpoint, with url: URL?, data: Data) {
        guard let targetCache = chacheDictionary[endpoint], let url else {
            return
        }
        let key = url.absoluteString as NSString
        targetCache.setObject(data as NSData, forKey: key)
    }
    
    // MARK: - Private methods
    private func setupCache() {
        for endpoint in RMEndpoint.allCases {
            chacheDictionary[endpoint] = NSCache<NSString, NSData>()
        }
    }
}
