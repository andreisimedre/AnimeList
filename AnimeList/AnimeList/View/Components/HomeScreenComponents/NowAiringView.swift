//
//  NowAiringView.swift
//  AnimeList
//
//  Created by Andrei Simedre on 03.12.2025.
//

import SwiftUI

struct NowAiringView: View {
    let anime: [Anime]

    var body: some View {
        VStack {
            HStack {
                Title(title: "Now showing")
                Spacer()
                CapsuleButton(title: "See more", font: Font.custom(FontNames.mulish.rawValue, size: 10), color: .grey)
            }

            ScrollView(.horizontal) {
                HStack(alignment: .top, spacing: 16) {
                    ForEach(anime) { anime in
                        PosterCellView(anime: anime)
                    }
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
        coverImage: "https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/405-umT1upaBF6VG.jpg"
    )
    let sampleAnime2 = Anime(
        id: 1
        , titleEnglish: "Naruto Shippuden aklnafs alknasfas fal/knaga galkng afalknfa faslknaf ",
        titleNative: "ナルト- 疾風伝",
        coverImage: "https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/405-umT1upaBF6VG.jpg"
    )
    NowAiringView(anime: [sampleAnime, sampleAnime2])
}
