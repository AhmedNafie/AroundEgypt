//
//  HomeRepository.swift
//  AroundEgypt
//
//  Created by Ahmed Nafie on 05/12/2024.
//

import Foundation

struct HomeRepository {
    private let networkingService = NetworkingService()

    func getRecommendedExperiences() async -> Result<ExperiencesResponse, Error> {
        guard let url = URL(string: Constants.Network.Endpoints.getRecommendedExperiences) else {
            return .failure(NetworkError.invalidURL)
        }
        let request = URLRequest(url: url)
        return await networkingService.request(request)
    }

    func getRecentExperiences() async -> Result<ExperiencesResponse, Error> {
        guard let url = URL(string: Constants.Network.Endpoints.getRecentExperiences) else {
            return .failure(NetworkError.invalidURL)
        }
        let request = URLRequest(url: url)
        return await networkingService.request(request)
    }

    func searchExperinces(with title: String) async -> Result<ExperiencesResponse, Error> {
        guard let url = URL(string: Constants.Network.Endpoints.searchExperinces(with: title)) else {
            return .failure(NetworkError.invalidURL)
        }
        let request = URLRequest(url: url)
        return await networkingService.request(request)
    }
            return .failure(NetworkError.invalidURL)
        }
        let request = URLRequest(url: url)
        return await networkingService.request(request)
    }
}
