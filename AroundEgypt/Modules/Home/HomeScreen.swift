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
                homeView()
            }
        }
        .padding(.top)
        .onViewDidLoad {
            await viewModel.viewDidLoad()
        }
        .errorAlert(error: $viewModel.error)
    }
}

private extension HomeScreen {
    func homeView() -> some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20) {
                HeaderView(searchText: $viewModel.searchText)
            }
        }
    }
}

#Preview {
    HomeScreen(viewModel: HomeViewModel())
}
