//
//  Header.swift
//  AnimeList
//
//  Created by Andrei Simedre on 05.12.2025.
//

import SwiftUI

struct Header: View {
    let anime: Anime

    var body: some View {
        ZStack {
            if let trailerImageUrl = URL(string: anime.trailerThumbnail ?? (anime.coverImage?.extraLarge ?? "")) {
                AsyncImage(url: trailerImageUrl) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Color.grey
                }
                .frame(height: 375)

                if anime.trailerUrl != nil {
                    Image("play")
                }
            }
        }
    }
}

#Preview {
    let sampleAnime = Anime(
        id: 0
        , titleEnglish: "Naruto Shippuden",
        titleNative: "ナルト- 疾風伝",
        bannerImage: "https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/405-umT1upaBF6VG.jpg",
        coverImage: CoverImage(
            large: "https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/b203006-lrK1C1awSLUb.jpg",
            extraLarge: "https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/b203006-lrK1C1awSLUb.jpg")
    )
    Header(anime: sampleAnime)
}
