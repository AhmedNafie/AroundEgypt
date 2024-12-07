//
//  ExperienceDetailsScreen.swift
//  AroundEgypt
//
//  Created by Ahmed Nafie on 07/12/2024.
//

import Kingfisher
import SwiftUI

struct ExperienceDetailsScreen: View {
    @StateObject var viewModel: ExperienceDetailsViewModel
    @State private var isLiked: Bool = false

    var body: some View {
        Group {
            ZStack {
                ScrollView {
                    VStack(alignment: .leading) {
                        KFImage(URL(string: viewModel.experience.imagePath))
                            .resizable()
                            .scaledToFit()
                            .frame(height: 300)
                            .cornerRadius(15)

                        VStack(alignment: .leading) {
                            HStack {
                                Text(viewModel.experience.title)
                                    .font(.title)
                                    .bold()

                                Spacer()

                                Image(.shareIcon)

                                Image(systemName: isLiked ? "heart.fill" : "heart")
                                    .foregroundColor(.peach)

                                Text("\(viewModel.experience.likes)")
                                    .font(.body)
                            }
                            .padding(.top)

                            Text(viewModel.experience.title)
                                .font(.headline)
                                .foregroundColor(.gray)

                        }
                        Spacer()
                        Color(.separator)
                            .frame(width: 341, height: 1)

                        VStack(alignment: .leading) {
                            Text(Constants.Text.description)
                                .font(.largeTitle.bold())
                                .padding(.top)

                            Text("experience.views.description")
                                .font(.body)
                        }
                    }
                    .padding()
                }

                if viewModel.isLoading {
                    Color.white
                        .edgesIgnoringSafeArea(.all)
                    ProgressView()
                }
            }
        }.onViewDidLoad {
            await viewModel.viewDidLoad()
            isLiked = LikesCacheManager.shared.getState(for: viewModel.experience.id)

        }
        .errorAlert(error: $viewModel.error)
    }
}
