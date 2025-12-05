//
//  PopularAnimeView.swift
//  AnimeList
//
//  Created by Andrei Simedre on 04.12.2025.
//

import SwiftUI
import AnimeListAPI

struct PopularAnimeView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @Bindable var homeViewModel: HomeViewModel

    var body: some View {
        ScrollViewReader { proxy in
            ZStack {
                if homeViewModel.isLoadingPopularList {
                    ProgressView()
                        .progressViewStyle(.circular)
                }
                VStack {
                    HStack {
                        Title(title: "Popular anime")
                        Spacer()
                        CapsuleButton(title: "See more", font: Font.custom(FontNames.mulish.rawValue, size: 10), color: .grey) {
                            guard homeViewModel.popularHasNextPage else { return }
                            
                            Task {
                                homeViewModel.popularNeedsReload = true
                                await homeViewModel.loadPopularAnime()
                            }
                        }
                    }
                    .padding(.bottom, 16)
                    
                    ScrollView(.vertical) {
                        VStack(alignment: .leading, spacing: 16) {
                            ForEach(homeViewModel.popularAnimeList) { anime in
                                PopularCellView(anime: anime)
                                    .onTapGesture {
                                        coordinator.push(page: .details(anime: anime))
                                    }
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                }
                .onChange(of: homeViewModel.popularAnimeList.count) { oldCount, newCount in
                    if newCount > oldCount {
                        // The view has been updated with new items.
                        // We can now safely scroll to the first new item.
                        let firstNewAnimeID = homeViewModel.popularAnimeList[oldCount].id
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
    let homeViewModel: HomeViewModel = {
        let vm = HomeViewModel()
        vm.popularAnimeList = [
            Anime(
                id: 0,
                titleEnglish: "Naruto Shippuden",
                titleNative: "ナルト- 疾風伝",
                coverImage: CoverImage(
                    large: "https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/405-umT1upaBF6VG.jpg",
                    extraLarge: "https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/405-umT1upaBF6VG.jpg")
            ),
            Anime(
                id: 1,
                titleEnglish: "A Very Long Title to Test Wrapping and Layout Behavior",
                titleNative: "ナルト- 疾風伝",
                coverImage: CoverImage(
                    large: "https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/405-umT1upaBF6VG.jpg",
                    extraLarge: "https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/405-umT1upaBF6VG.jpg")
            )
        ]
        return vm
    }()

    PopularAnimeView(homeViewModel: homeViewModel)
        .environmentObject(Coordinator())
}
