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
            Text("Welcome!")
                .font(.title2.bold())
                .foregroundColor(.black)

            Text(
                "Now you can explore any experience in 360 degrees and get all the details about it all in one place."
            )
            .font(.body)
            .foregroundColor(.black)
        }
        .padding(.horizontal)
    }
}


#Preview {
    WelcomeView()
}
