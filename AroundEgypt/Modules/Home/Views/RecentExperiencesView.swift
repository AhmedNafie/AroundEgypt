//
//  RecentExperiencesView.swift
//  AroundEgypt
//
//  Created by Ahmed Nafie on 07/12/2024.
//

import SwiftUI

struct RecentExperiencesView: View {
    @Binding var experinces: [Experience]

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Most Recent")
                .font(.title2.bold())
                .foregroundColor(.black)
                .padding(.leading)

            LazyVStack(spacing: 15) {
                ForEach(experinces) { experience in
                    ExperienceCardView(experience: experience)
                }
            }
        }
    }
}

#Preview {
    RecentExperiencesView(
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
