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
        let result = await interactor.fetchExperiences()
        switch result {
            case .success(let experinces):
                text = experinces.first ?? ""
            case .failure(let error):
                self.error = error
        }
    }
}
