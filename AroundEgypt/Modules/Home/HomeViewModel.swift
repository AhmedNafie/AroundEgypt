//
//  HomeViewModel.swift
//  AroundEgypt
//
//  Created by Ahmed Nafie on 05/12/2024.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var recommendedExperiences: [Experience] = []
    @Published var recentExperiences: [Experience] = []
    @Published var isLoading: Bool = true
    @Published var error: Error?

    private let interactor = HomeInteractor()

    @MainActor
    func viewDidLoad() async {
        async let recommendedExperiences: () = fetchRecommendedExperiences()
        async let recentExperiences: () = fetchRecentExperiences()
        _ = await (recommendedExperiences, recentExperiences)
        isLoading = false
    }
}

private extension HomeViewModel {
    @MainActor
    func fetchRecommendedExperiences() async {
        let result = await interactor.fetchRecommendedExperiences()
        switch result {
            case .success(let response):
                recommendedExperiences = response.data.map {
                    .init(
                        imagePath: $0.imagePath,
                        title: $0.title,
                        views: $0.views,
                        likes: $0.likes,
                        isRecommended: true
                    )
                }
            case .failure(let error):
                self.error = error
        }
    }

    @MainActor
    func fetchRecentExperiences() async {
        let result = await interactor.fetchRecentExperiences()
        switch result {
            case .success(let response):
                recentExperiences = response.data.map {
                    .init(
                        imagePath: $0.imagePath,
                        title: $0.title,
                        views: $0.views,
                        likes: $0.likes,
                        isRecommended: false
                    )
                }
            case .failure(let error):
                self.error = error
        }
    }
}
