//
//  ExperienceDetailsViewModel.swift
//  AroundEgypt
//
//  Created by Ahmed Nafie on 07/12/2024.
//

import Foundation

final class ExperienceDetailsViewModel: ObservableObject {
    @Published var selectedID: String = ""
    @Published var experience: ExperienceDetails = .empty
    @Published var isLoading: Bool = true
    @Published var error: Error?

    private let interactor = ExperienceDetailsInteractor()

    init(selectedID: String) {
        self.selectedID = selectedID
    }

    @MainActor
    func viewDidLoad() async {
        let result = await interactor.fetchSingleExperience(with: selectedID)
        isLoading = false
        switch result {
            case .success(let response):
                experience = .init(
                    id: response.data.id,
                    imagePath: response.data.imagePath,
                    title: response.data.title,
                    description: response.data.description,
                    cityName: response.data.city.name,
                    views: response.data.views,
                    likes: response.data.likes
                )
            case .failure(let error):
                self.error = error
        }
    }
}
