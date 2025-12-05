//
//  DetailsView.swift
//  AnimeList
//
//  Created by Andrei Simedre on 04.12.2025.
//

import SwiftUI

struct DetailsScreen: View {
    let anime: Anime

    var body: some View {
        VStack(spacing: -100) {
            Header(imageUrl: anime.coverImage?.extraLarge)
            DetailsSection(anime: anime)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    let sampleAnime = Anime(
        id: 0
        , titleEnglish: "Naruto Shippuden",
        titleNative: "ナルト- 疾風伝",
        coverImage: CoverImage(
            large: "https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/405-umT1upaBF6VG.jpg",
            extraLarge: "https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/405-umT1upaBF6VG.jpg")
    )
    DetailsScreen(anime: sampleAnime)
}
