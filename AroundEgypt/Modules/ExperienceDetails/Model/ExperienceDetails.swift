//
//  ExperienceDetails.swift
//  AroundEgypt
//
//  Created by Ahmed Nafie on 08/12/2024.
//

import SwiftUI

struct ExperienceDetails: Identifiable {
    let id: String
    let imagePath: String
    let title: String
    let description: String
    let cityName: String
    let views: Int
    var likes: Int
}

extension ExperienceDetails {
    static let empty = ExperienceDetails(
        id: "0",
        imagePath: "",
        title: "",
        description: "",
        cityName: "",
        views: 0,
        likes: 0
    )
}
