//
//  WelcomeView.swift
//  AroundEgypt
//
//  Created by Ahmed Nafie on 07/12/2024.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text(Constants.Text.welcomeTitle)
                .font(.title2.bold())
                .foregroundColor(.black)

            Text(Constants.Text.welcomeDetails)
            .font(.body)
            .foregroundColor(.black)
        }
        .padding(.horizontal)
    }
}

#Preview {
    WelcomeView()
}
