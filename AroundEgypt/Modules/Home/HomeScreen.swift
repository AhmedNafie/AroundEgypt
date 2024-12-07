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
            HeaderView(viewModel: viewModel)
            ZStack {
                homeView()
                if viewModel.isLoading {
                    Color.white
                        .edgesIgnoringSafeArea(.all)
                    ProgressView()
                }
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
            VStack(spacing: 20) {
                if viewModel.isSearching {
                    if viewModel.filteredExperiences.isEmpty {
                        Text(Constants.Text.noResults)
                            .font(.title.bold())
                            .padding()
                    } else {
                        ExperiencesListView(
                            viewModel: viewModel,
                            experinces: $viewModel.filteredExperiences
                        )
                    }
                } else {
                    WelcomeView()
                    RecommendedExperiencesView(
                        viewModel: viewModel,
                        experinces: $viewModel.recommendedExperiences
                    )
                    VStack(alignment: .leading, spacing: 10) {
                        Text(Constants.Text.mostRecent)
                            .font(.title2.bold())
                            .foregroundColor(.black)
                            .padding(.leading)
                        ExperiencesListView(
                            viewModel: viewModel,
                            experinces: $viewModel.recentExperiences
                        )
                    }
                }
            }
        }
    }
}

#Preview {
    HomeScreen(viewModel: HomeViewModel())
}
