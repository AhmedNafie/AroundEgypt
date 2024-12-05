//
//  HomeInteractor.swift
//  AroundEgypt
//
//  Created by Ahmed Nafie on 05/12/2024.
//

import Foundation

struct HomeInteractor {
    func fetchExperiences() async -> Result<[String], Error> {
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        return .success(["New Data!"])
    }
}
