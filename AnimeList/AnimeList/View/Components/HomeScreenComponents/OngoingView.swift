//
//  OngoingView.swift
//  AnimeList
//
//  Created by Andrei Simedre on 03.12.2025.
//

import SwiftUI
import AnimeListAPI

struct OngoingView: View {
    let anime: [Anime]
    @Binding var homeViewModel: HomeViewModel

    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                HStack {
                    Title(title: "Ongoing shows")
                    Spacer()
                    CapsuleButton(title: "See more", font: Font.custom(FontNames.mulish.rawValue, size: 10), color: .grey) {
                        guard homeViewModel.hasNextPage else { return }

                        Task {
                            homeViewModel.needsReload = true
                            await homeViewModel.loadAnime(status: .releasing)
                        }
                    }
                }

                ScrollView(.horizontal) {
                    HStack(alignment: .top, spacing: 16) {
                        ForEach(anime) { anime in
                            PosterCellView(anime: anime)
                        }
                    }
                }
                .onChange(of: anime.count) { oldCount, newCount in
                    if newCount > oldCount {
                        // The view has been updated with new items.
                        // We can now safely scroll to the first new item.
                        let firstNewAnimeID = anime[oldCount].id
                        withAnimation(.bouncy(duration: 1)) {
                            proxy.scrollTo(firstNewAnimeID, anchor: .leading)
                        }
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
    OngoingView(anime: [sampleAnime, sampleAnime2], homeViewModel: .constant(HomeViewModel()))
}
