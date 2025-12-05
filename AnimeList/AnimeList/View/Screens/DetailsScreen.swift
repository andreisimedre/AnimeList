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
        HStack {
            
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
    DetailsScreen(anime: sampleAnime)
}
