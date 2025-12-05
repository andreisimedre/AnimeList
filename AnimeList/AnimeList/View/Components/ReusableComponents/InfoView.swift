//
//  InfoView.swift
//  AnimeList
//
//  Created by Andrei Simedre on 05.12.2025.
//

import SwiftUI

struct InfoView: View {
    let anime: Anime
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Group {
                    Text("Lenght")
                        .foregroundStyle(.grey)
                    Text(anime.getDuration())
                }
                .font(.custom(FontNames.mulish.rawValue, size: 12))
            }
            Spacer()
            VStack(alignment: .leading) {
                Group {
                    Text("Language")
                        .foregroundStyle(.grey)
                    Text("English")
                }
                .font(.custom(FontNames.mulish.rawValue, size: 12))
            }
            Spacer()
            VStack(alignment: .leading) {
                Group {
                    Text("Rating")
                        .foregroundStyle(.grey)
                    Text(anime.isAdult ?? false ? "R18+" : "PG13")
                }
                .font(.custom(FontNames.mulish.rawValue, size: 12))
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
    InfoView(anime: sampleAnime)
}
