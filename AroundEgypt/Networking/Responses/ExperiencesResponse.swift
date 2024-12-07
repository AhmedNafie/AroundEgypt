//
//  ExperiencesResponse.swift
//  AroundEgypt
//
//  Created by Ahmed Nafie on 06/12/2024.
//

import Foundation

// MARK: - ExperiencesResponse
struct ExperiencesResponse: Decodable {
    let meta: Meta
    let data: [ExperienceResponse]
    let pagination: Pagination
}

// MARK: - ExperienceResponse
struct ExperienceResponse: Decodable {
    let id, title: String
    let imagePath: String
    let description: String
    let views, likes, recommended, hasVideo: Int
    let tags: [City]
    let city: City
    let tourHTML: String
    let famousFigure: String
    let period, era: Era?
    let founded, detailedDescription, address: String
    let gmapLocation: GmapLocation
    let startingPrice: Int?
    let ticketPrices: [TicketPrice]
    let isLiked: Bool?
    let reviews: [Review]
    let rating, reviewsNo: Int
    let audioURL: String
    let hasAudio: Bool

    enum CodingKeys: String, CodingKey {
        case id, title
        case imagePath = "cover_photo"
        case description
        case views = "views_no"
        case likes = "likes_no"
        case recommended
        case hasVideo = "has_video"
        case tags, city
        case tourHTML = "tour_html"
        case famousFigure = "famous_figure"
        case period, era, founded
        case detailedDescription = "detailed_description"
        case address
        case gmapLocation = "gmap_location"
        case startingPrice = "starting_price"
        case ticketPrices = "ticket_prices"
        case isLiked = "is_liked"
        case reviews, rating
        case reviewsNo = "reviews_no"
        case audioURL = "audio_url"
        case hasAudio = "has_audio"
    }
}

// MARK: - City
struct City: Decodable {
    let id: Int
    let name: String
    let topPick: Int

    enum CodingKeys: String, CodingKey {
        case id, name
        case topPick = "top_pick"
    }
}

// MARK: - Era
struct Era: Decodable {
    let id, value, createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id, value
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - GmapLocation
struct GmapLocation: Decodable {
    let type: String
    let coordinates: [Double]
}

// MARK: - Review
struct Review: Decodable {
    let id, experience, name: String
    let rating: Int
    let comment, createdAt: String

    enum CodingKeys: String, CodingKey {
        case id, experience, name, rating, comment
        case createdAt = "created_at"
    }
}

// MARK: - TicketPrice
struct TicketPrice: Decodable {
    let type: String
    let price: Int
}

// MARK: - Meta
struct Meta: Decodable {
    let code: Int
    let errors: [String]
}

// MARK: - Pagination
struct Pagination: Decodable {
}
