//
//  ExperienceDetailsInteractor.swift
//  AroundEgypt
//
//  Created by Ahmed Nafie on 07/12/2024.
//

import Foundation

struct ExperienceDetailsInteractor {
    private let repository = ExperiencesRepository()

    func fetchSingleExperience(with id: String) async -> Result<SingleExperienceResponse, Error> {
        await repository.getSingleExperince(with: id)
    }

    func likeExperince(with id: String) async -> Result<LikesResponse, Error> {
        await repository.likeExperince(with: id)
    }
}
