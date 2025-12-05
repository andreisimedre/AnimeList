//
//  Header.swift
//  AnimeList
//
//  Created by Andrei Simedre on 05.12.2025.
//

import SwiftUI

struct Header: View {
    let imageUrl: String?

    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: imageUrl ?? "")) { image in
                image
                    .resizable()
            } placeholder: {
                Color.grey
            }
            .frame(height: 375)

            Image("play")
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
    Header(imageUrl: sampleAnime.coverImage?.extraLarge)
}
