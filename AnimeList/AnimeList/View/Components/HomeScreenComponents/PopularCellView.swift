//
//  PopularCellView.swift
//  AnimeList
//
//  Created by Andrei Simedre on 05.12.2025.
//

import SwiftUI

struct PopularCellView: View {
    let anime: Anime

    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: URL(string: anime.coverImage?.large ?? "")) { image in
                image
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 5))
            } placeholder: {
                Image("placeholderImage")
                    .resizable()
            }
            .frame(width: 85, height: 120)
            VStack(alignment: .leading) {
                Text(anime.titleEnglish ?? (anime.titleNative ?? "Unknown title"))
                    .font(.custom(FontNames.mulish.rawValue, size: 14))
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)

                HStack {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 13, height: 13)
                        .foregroundStyle(.starYellow)
                    Text("\(String(anime.averageScore ?? 0))/100 Score")
                        .font(.custom(FontNames.mulish.rawValue, size: 12))
                        .foregroundColor(.grey)

                }

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

                HStack {
                    Image(systemName: "clock")
                        .resizable()
                        .frame(width: 9.72)
                        .frame(height: 9.72)
                    Text(anime.getDuration())
                        .font(.custom(FontNames.mulish.rawValue, size: 12))
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
        coverImage: CoverImage(
            large: "https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/405-umT1upaBF6VG.jpg",
            extraLarge: "https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/405-umT1upaBF6VG.jpg")
    )
    PopularCellView(anime: sampleAnime)
}
