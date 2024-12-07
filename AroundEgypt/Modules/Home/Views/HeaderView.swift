//
//  HeaderView.swift
//  AroundEgypt
//
//  Created by Ahmed Nafie on 05/12/2024.
//

import SwiftUI

struct HeaderView: View {
    @Binding var searchText: String

    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: "line.horizontal.3")
                .resizable()
                .scaledToFit()
                .frame(width: 18)
                .foregroundColor(.black)

            searchBar()

            Image(systemName: "slider.horizontal.3")
                .resizable()
                .scaledToFit()
                .frame(width: 18)
                .foregroundColor(.black)
        }
        .padding(.horizontal)

        welcomeView()
    }
}

private extension HeaderView {
    func searchBar() -> some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)

            TextField("Try “Luxor”", text: $searchText)
                .foregroundColor(.black)
                .frame(height: 20)
        }
        .padding(10)
        .background(.searchBar.opacity(0.12))
        .cornerRadius(10)
    }

    func welcomeView() -> some View {
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
    HeaderView(searchText: .constant(""))
}
