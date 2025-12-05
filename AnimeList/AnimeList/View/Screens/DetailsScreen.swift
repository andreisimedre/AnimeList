//
//  DetailsView.swift
//  AnimeList
//
//  Created by Andrei Simedre on 04.12.2025.
//

import SwiftUI

struct DetailsScreen: View {
    @State var viewModel: DetailsViewModel

    init(viewModel: DetailsViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(spacing: -100) {
            Header(imageUrl: viewModel.anime?.coverImage?.extraLarge)
            if let anime = viewModel.anime {
                DetailsSection(anime: anime)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    let viewModel = DetailsViewModel(id: 102)
    DetailsScreen(viewModel: viewModel)
}
