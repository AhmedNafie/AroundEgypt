//
//  ExperiencesListView.swift
//  AroundEgypt
//
//  Created by Ahmed Nafie on 07/12/2024.
//

import SwiftUI

struct ExperiencesListView: View {
    let onSelectExperience: (String) -> Void
    let onLikeExperience: (String) -> Void
    @Binding var experinces: [Experience]

    var body: some View {
        LazyVStack(spacing: 15) {
            ForEach(experinces) { experience in
                ExperienceCardView(
                    experience: experience,
                    onSelectExperience: onSelectExperience,
                    onLikeExperience: onLikeExperience
                )
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    ExperiencesListView(
        onSelectExperience: {_ in},
        onLikeExperience: {_ in},
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
