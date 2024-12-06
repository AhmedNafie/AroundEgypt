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
        Group {
            if viewModel.isLoading {
                ProgressView()
            } else {
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text(viewModel.text)
                }
            }
        }
        .padding()
        .onViewDidLoad {
            await viewModel.viewDidLoad()
        }
        .errorAlert(error: $viewModel.error)
    }
}

#Preview {
    HomeScreen(viewModel: HomeViewModel())
}
