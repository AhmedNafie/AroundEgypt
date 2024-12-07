//
//  RecommendedExperiencesView.swift
//  AroundEgypt
//
//  Created by Ahmed Nafie on 07/12/2024.
//

import SwiftUI

struct RecommendedExperiencesView: View {
    var viewModel: HomeViewModel
    @Binding var experinces: [Experience]

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(Constants.Text.recommendedExperiences)
                .font(.title2.bold())
                .foregroundColor(.black)
                .padding(.leading)

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 15) {
                    ForEach(experinces) { experience in
                        ExperienceCardView(
                            viewModel: viewModel,
                            experience: experience
                        )
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    RecommendedExperiencesView(
        viewModel: .init(),
        experinces:
            .constant(
                [
                    .previewList[0],
                    .previewList[1],
                    .previewList[2],
                ]
            )
    )
}
