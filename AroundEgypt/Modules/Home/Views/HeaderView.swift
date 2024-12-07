//
//  HeaderView.swift
//  AroundEgypt
//
//  Created by Ahmed Nafie on 05/12/2024.
//

import SwiftUI

struct HeaderView: View {
    var viewModel: HomeViewModel
    @State private var searchText: String = ""

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
                .onSubmit {
                    viewModel.search(with: searchText)
                }
        }
        .padding(10)
        .background(.searchBar.opacity(0.12))
        .cornerRadius(10)
    }
}

#Preview {
    HeaderView(viewModel: .init())
}
