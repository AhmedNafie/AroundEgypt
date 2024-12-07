//
//  ExperienceCardView.swift
//  AroundEgypt
//
//  Created by Ahmed Nafie on 06/12/2024.
//

import SwiftUI
import Kingfisher

struct ExperienceCardView: View {
    let experience: Experience
    private let width = UIScreen.main.bounds.width - 40

    var body: some View {
        VStack(spacing: 14) {
            ZStack(alignment: .bottom) {
                imageView()
                gradientView()
            }
            .cornerRadius(7)

            infoView()
        }
        .background(Color.white)
    }
}

private extension ExperienceCardView {
    func imageView() -> some View {
        KFImage(URL(string: experience.imagePath))
            .frame(width: width, height: width * 0.45)
            .scaledToFill()
            .clipped()
            .overlay(alignment: .topLeading) {
                if experience.isRecommended {
                    HStack(spacing: 5) {
                        Image(systemName: "star.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 10)
                            .foregroundColor(.peach)

                        Text(Constants.Text.recommended)
                            .font(.caption.bold())
                            .foregroundStyle(.white)
                    }
                    .padding(5)
                    .background(
                        Capsule()
                            .fill(.black.opacity(0.5))
                    )
                    .padding(.top, 7)
                    .padding(.leading, 10)
                }
            }
            .overlay(alignment: .center) {
                Image(.threeSixtyIcon)
                    .resizable()
                    .frame(width: 37, height: 37)

            }
            .overlay(alignment: .topTrailing) {
                Image(.infoIcon)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.trailing, 12)
                    .padding(.top, 7)

            }
    }

    func gradientView() -> some View {
        LinearGradient(
            gradient: Gradient(
                colors: [
                    Color.black.opacity(1),
                    Color.clear,
                ]
            ),
            startPoint: .bottom,
            endPoint: .top
        )
        .frame(width: width, height: 50)
        .overlay(alignment: .bottomLeading) {
            HStack(spacing: 5) {
                Image(systemName: "eye.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 10)
                Text("\(experience.views)")
                    .font(.body.bold())
            }
            .foregroundStyle(.white)
            .padding(.leading, 10)
            .padding(.bottom, 12)
        }
        .overlay(alignment: .bottomTrailing) {
            Image(.galleryIcon)
                .resizable()
                .scaledToFit()
                .frame(height: 16)
                .padding(.trailing, 12)
                .padding(.bottom, 12)
        }
    }

    func infoView() -> some View {
        HStack {
            Text(experience.title)
                .font(.body.bold())

            Spacer()

            HStack(spacing: 5) {
                Text("\(experience.likes)")
                    .font(.body.bold())
                Image(systemName: "heart.fill")
                    .foregroundColor(.peach)
            }
        }
    }
}

#Preview {
    ExperienceCardView(experience: .preview)
}
