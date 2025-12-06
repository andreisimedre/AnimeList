//
//  DetailsView.swift
//  AnimeList
//
//  Created by Andrei Simedre on 04.12.2025.
//

import SwiftUI
import AVFoundation

struct DetailsScreen: View {
    @Environment(\.openURL) var openURL
    @State var viewModel: DetailsViewModel

    init(animeId: Int) {
        self.viewModel = DetailsViewModel(animeId: animeId)
    }

    var body: some View {
        VStack(spacing: -100) {
            if let anime = viewModel.anime {
                Header(anime: anime)
                    .onTapGesture {
                        if let url = anime.trailerUrl {
                            openURL(url)
                        }
                    }
                DetailsSection(viewModel: viewModel)
            } else {
                if viewModel.isLoading {
                    ProgressView()
                        .tint(.darkBlue)
                } else {
                    ContentUnavailableView("No details available", systemImage: "magnifyingglass")
                }
            }
        }
        .ignoresSafeArea()
        .task {
            await viewModel.loadAnime()
        }
    }
}

#Preview {
    DetailsScreen(animeId: 102)
}
