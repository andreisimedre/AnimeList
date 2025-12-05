//
//  OngoingCellView.swift
//  AnimeList
//
//  Created by Andrei Simedre on 03.12.2025.
//

import SwiftUI
import AnimeListAPI

struct OngoingCellView: View {
    let anime: Anime

    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: anime.coverImage?.large ?? "")) { image in
                image
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 5))
            } placeholder: {
                Image("placeholderImage")
                    .resizable()
            }
            .frame(width: 143, height: 212)

            Text(anime.titleEnglish ?? (anime.titleNative ?? "Unknown title"))
                .font(.custom(FontNames.mulish.rawValue, size: 14))
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)

            ScoreView(score: anime.averageScore)
        }
        .frame(width: 143)

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
    OngoingCellView(anime: sampleAnime)
}
