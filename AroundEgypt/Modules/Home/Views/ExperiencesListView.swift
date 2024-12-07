//
//  ExperiencesListView.swift
//  AroundEgypt
//
//  Created by Ahmed Nafie on 07/12/2024.
//

import SwiftUI

struct ExperiencesListView: View {
    @Binding var experinces: [Experience]

    var body: some View {
        LazyVStack(spacing: 15) {
            ForEach(experinces) { experience in
                ExperienceCardView(experience: experience)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    ExperiencesListView(
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
