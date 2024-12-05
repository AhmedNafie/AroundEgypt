//
//  HomeViewModel.swift
//  AroundEgypt
//
//  Created by Ahmed Nafie on 05/12/2024.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published var text: String = "Hello, world!"

    func viewDidLoad() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.text = "New Data!"
        }
    }
}
