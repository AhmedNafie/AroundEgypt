//
//  HomeInteractor.swift
//  AroundEgypt
//
//  Created by Ahmed Nafie on 05/12/2024.
//

import Foundation

struct HomeInteractor {
    private let repository = HomeRepository()

    func fetchRecommendedExperiences() async -> Result<ExperiencesResponse, Error> {
        await repository.getRecommendedExperiences()
    }

    func fetchRecentExperiences() async -> Result<ExperiencesResponse, Error> {
        await repository.getRecentExperiences()
    }

    func searchExperinces(with title: String) async -> Result<ExperiencesResponse, Error> {
        await repository.searchExperinces(with: title)
    }
}
