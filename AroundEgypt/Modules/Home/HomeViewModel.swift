//
//  HomeViewModel.swift
//  AroundEgypt
//
//  Created by Ahmed Nafie on 05/12/2024.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published var recommendedExperiences: [Experience] = []
    @Published var recentExperiences: [Experience] = []
    @Published var filteredExperiences: [Experience] = []
    @Published var isLoading: Bool = true
    @Published var isSearching: Bool = false
    @Published var error: Error?

    private let interactor = HomeInteractor()

    @MainActor
    func viewDidLoad() async {
        async let recommendedExperiences: () = fetchRecommendedExperiences()
        async let recentExperiences: () = fetchRecentExperiences()
        _ = await (recommendedExperiences, recentExperiences)
        isLoading = false
    }

    func search(with title: String) {
        isSearching = !title.isEmpty
        guard !title.isEmpty else {
            filteredExperiences.removeAll()
            return
        }
        Task { @MainActor in
            isLoading = true
            let result = await interactor.searchExperinces(with: title)
            isLoading = false
            switch result {
                case .success(let response):
                    filteredExperiences = response.data.map {
                        .init(
                            id: $0.id,
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

    func likeExperince(with id: String) {
        Task { @MainActor in
            let result = await interactor.likeExperince(with: id)
            switch result {
                case .success(let response):
                    if let index = recommendedExperiences.firstIndex(where: { $0.id == id }) {
                        recommendedExperiences[index].likes = response.data
                    }
                    if let index = recentExperiences.firstIndex(where: { $0.id == id }) {
                        recentExperiences[index].likes = response.data
                    }
                case .failure(let error):
                    self.error = error
            }
        }
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
                        id: $0.id,
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
                        id: $0.id,
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
