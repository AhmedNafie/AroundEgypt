//
//  HomeRepository.swift
//  AroundEgypt
//
//  Created by Ahmed Nafie on 05/12/2024.
//

import Foundation

struct HomeRepository {
    private let networkingService = NetworkingService()
    private let cachingService = CachingService()

    func getRecommendedExperiences() async -> Result<ExperiencesResponse, Error> {
        guard let url = URL(string: Constants.Network.Endpoints.getRecommendedExperiences) else {
            return .failure(NetworkError.invalidURL)
        }
        let request = URLRequest(url: url)
        let result: Result<ExperiencesResponse, Error> = await networkingService.request(request)
        switch result {
            case .success(let response):
                return handleSuccess(response, isRecommended: true)
            case .failure(let error):
                return handleFailure(error, isRecommended: true)
        }
    }

    func getRecentExperiences() async -> Result<ExperiencesResponse, Error> {
        guard let url = URL(string: Constants.Network.Endpoints.getRecentExperiences) else {
            return .failure(NetworkError.invalidURL)
        }
        let request = URLRequest(url: url)
        let result: Result<ExperiencesResponse, Error> = await networkingService.request(request)
        switch result {
            case .success(let response):
                return handleSuccess(response)
            case .failure(let error):
                return handleFailure(error)
        }
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

private extension HomeRepository {
    func handleSuccess(_ response: (ExperiencesResponse), isRecommended: Bool = false) -> Result<
        ExperiencesResponse, any Error
    > {
        cachingService.clearCache(isRecommended: isRecommended)
        cachingService.cacheExperienceResponses(response.data, isRecommended: isRecommended)
        return .success(response)
    }

    func handleFailure(_ error: (any Error), isRecommended: Bool = false) -> Result<ExperiencesResponse, any Error> {
        if let error = error as? NetworkError {
            switch error {
                case .noInternetConnection:
                    if let experiences = cachingService.getCachedExperienceResponses(isRecommended: isRecommended) {
                        return .success(.init(data: experiences))
                    }
                    return .failure(error)
                default: break
            }
        }
        return .failure(error)
    }
}
