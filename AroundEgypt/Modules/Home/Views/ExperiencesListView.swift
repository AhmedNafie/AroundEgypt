//
//  ExperiencesListView.swift
//  AroundEgypt
//
//  Created by Ahmed Nafie on 07/12/2024.
//

import SwiftUI

struct ExperiencesListView: View {
    var viewModel: HomeViewModel
    @Binding var experinces: [Experience]

    var body: some View {
        LazyVStack(spacing: 15) {
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

#Preview {
    ExperiencesListView(
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
