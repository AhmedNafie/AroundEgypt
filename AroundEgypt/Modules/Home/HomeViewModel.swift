//
//  HomeViewModel.swift
//  AroundEgypt
//
//  Created by Ahmed Nafie on 05/12/2024.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published var text: String = "Hello, world!"
    @Published var error: Error?

    private let interactor = HomeInteractor()

    @MainActor
    func viewDidLoad() async {
        async let recommendedExperiences: () = fetchRecommendedExperiences()
        async let recentExperiences: () = fetchRecentExperiences()
        _ = await (recommendedExperiences, recentExperiences)
    }
}

private extension HomeViewModel {
    @MainActor
    func fetchRecommendedExperiences() async {
        let result = await interactor.fetchRecommendedExperiences()
        switch result {
            case .success(let response):
                text = response.data.first?.title ?? ""
            case .failure(let error):
                self.error = error
        }
    }

    @MainActor
    func fetchRecentExperiences() async {
        let result = await interactor.fetchRecentExperiences()
        switch result {
            case .success(let response):
                text = response.data.first?.title ?? ""
            case .failure(let error):
                self.error = error
        }
    }
}
