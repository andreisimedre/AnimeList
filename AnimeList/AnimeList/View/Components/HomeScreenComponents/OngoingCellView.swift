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
            AsyncImage(url: URL(string: anime.coverImage ?? "")) { image in
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

            HStack {
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 13, height: 13)
                    .foregroundStyle(.starYellow)
                Text("\(String(anime.averageScore ?? 0))/100 Score")
                    .font(.custom(FontNames.mulish.rawValue, size: 12))
                    .foregroundColor(.grey)
            }
        }
        .frame(width: 143)

    }
}

#Preview {
    let sampleAnime = Anime(
        id: 0
        , titleEnglish: "Naruto Shippuden",
        titleNative: "ナルト- 疾風伝",
        coverImage: "https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/405-umT1upaBF6VG.jpg"
    )
    OngoingCellView(anime: sampleAnime)
}
