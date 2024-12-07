//
//  AroundEgyptApp.swift
//  AroundEgypt
//
//  Created by Ahmed Nafie on 05/12/2024.
//

import SwiftUI

@main
struct AroundEgyptApp: App {
    init() {
        UIView.appearance().overrideUserInterfaceStyle = .light
    }

    var body: some Scene {
        WindowGroup {
            HomeScreen(viewModel: HomeViewModel())
        }
    }
}
