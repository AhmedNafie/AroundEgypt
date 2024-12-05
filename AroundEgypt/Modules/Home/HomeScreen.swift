//
//  HomeScreen.swift
//  AroundEgypt
//
//  Created by Ahmed Nafie on 05/12/2024.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var viewModel: HomeViewModel

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(viewModel.text)
        }
        .padding()
        .onViewDidLoad {
            await viewModel.viewDidLoad()
        }
    }
}

#Preview {
    HomeScreen(viewModel: HomeViewModel())
}
