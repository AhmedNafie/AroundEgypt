//
//  HomeRepository.swift
//  AroundEgypt
//
//  Created by Ahmed Nafie on 05/12/2024.
//

import Foundation

struct HomeRepository {
    private let networkingService = NetworkingService()

    func getExperiences() async -> Result<[String], Error> {
        let url = URL(string: "https://example.com/")!
        let request = URLRequest(url: url)
        return await networkingService.request(request)
    }
}
