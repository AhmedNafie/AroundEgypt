//
//  HomeInteractor.swift
//  AroundEgypt
//
//  Created by Ahmed Nafie on 05/12/2024.
//

import Foundation

struct HomeInteractor {
    private let repository = HomeRepository()

    func fetchExperiences() async -> Result<[String], Error> {
        await repository.getExperiences()
    }
}
