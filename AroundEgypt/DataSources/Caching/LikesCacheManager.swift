//
//  LikesCacheManager.swift
//  AroundEgypt
//
//  Created by Ahmed Nafie on 07/12/2024.
//

import Foundation

class LikesCacheManager {
    static let shared = LikesCacheManager()
    private var likedCache: [String] = []

    private init() {
        if let cachedArray = UserDefaults.standard.array(forKey: "likedCacheKey") as? [String] {
            likedCache = cachedArray
        }
    }

    func likeTapped(with id: String) {
        likedCache.append(id)
        UserDefaults.standard.set(likedCache, forKey: "likedCacheKey")
    }

    func getState(for id: String) -> Bool {
        likedCache.contains(id)
    }
}
