//
//  DetailsSection.swift
//  AnimeList
//
//  Created by Andrei Simedre on 05.12.2025.
//

import SwiftUI

struct DetailsSection: View {
    let anime: Anime

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ScrollView(.vertical) {
                HStack(alignment: .top) {
                    Text(anime.titleEnglish ?? (anime.titleNative ?? "Unknown title"))
                        .font(.custom(FontNames.mulish.rawValue, size: 20))
                    Spacer()
                    Image(systemName: "bookmark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
                .padding(.top, 24)

                ScoreView(score: anime.averageScore)
                    .padding(.bottom, 16)

                if let genres = anime.genres {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(genres, id: \.self) { genre in
                                if let genre = genre {
                                    GenreCapsuleView(genre: genre)
                                }
                            }
                        }
                    }
                    .frame(height: 18)
                    .scrollIndicators(.hidden)
                }

                InfoView(anime: anime)
                    .padding(.vertical, 16)
                Title(title: "Description")
                    .padding(.bottom, 16)
                Text(anime.description ?? "No description available")
                    .font(.custom(FontNames.mulish.rawValue, size: 12))
                    .foregroundStyle(.grey)
                HStack {
                    Title(title: "Cast")
                    Spacer()
                    CapsuleButton(title: "See more", font: .custom(FontNames.mulish.rawValue, size: 12), color: .grey)
                }
                .padding(.vertical, 16)

            }
            .padding(.horizontal, 24)
            .background(.white)
            .clipShape(.rect(topLeadingRadius: 10, topTrailingRadius: 10))
        }
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
    DetailsSection(anime: sampleAnime)
}
