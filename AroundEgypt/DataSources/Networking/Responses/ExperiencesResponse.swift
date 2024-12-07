//
//  ExperiencesResponse.swift
//  AroundEgypt
//
//  Created by Ahmed Nafie on 06/12/2024.
//

import Foundation

// MARK: - ExperiencesResponse
struct ExperiencesResponse: Decodable {
    let data: [ExperienceResponse]
}

// MARK: - ExperienceResponse
struct ExperienceResponse: Decodable {
    let id, title: String
    let imagePath: String
    let description: String
    let views, likes: Int
    let city: City
    let detailedDescription: String
    let isRecommended: Bool?

    enum CodingKeys: String, CodingKey {
        case id, title
        case imagePath = "cover_photo"
        case description
        case views = "views_no"
        case likes = "likes_no"
        case city
        case detailedDescription = "detailed_description"
        case isRecommended
    }
}

// MARK: - City
struct City: Decodable {
    let name: String
}
