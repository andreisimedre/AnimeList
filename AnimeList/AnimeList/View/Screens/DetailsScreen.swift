//
//  DetailsView.swift
//  AnimeList
//
//  Created by Andrei Simedre on 04.12.2025.
//

import SwiftUI

struct DetailsScreen: View {
    @State var viewModel: DetailsViewModel

    init(animeId: Int) {
        self.viewModel = DetailsViewModel(animeId: animeId)
    }

    var body: some View {
        VStack(spacing: -100) {
            Header(imageUrl: viewModel.anime?.coverImage?.extraLarge)
            DetailsSection(viewModel: viewModel)
        }
        .ignoresSafeArea()
        .task {
            await viewModel.loadAnime()
        }
    }
}

#Preview {
//    var viewModel = DetailsViewModel()
//    let sampleAnime = Anime(
//        id: 0
//        , titleEnglish: "Naruto Shippuden",
//        titleNative: "ナルト- 疾風伝",
//        coverImage: CoverImage(
//            large: "https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/405-umT1upaBF6VG.jpg",
//            extraLarge: "https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/405-umT1upaBF6VG.jpg")
//    )
//    viewModel.anime = sampleAnime
    DetailsScreen(animeId: 102)
}
