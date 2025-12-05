//
//  OngoingView.swift
//  AnimeList
//
//  Created by Andrei Simedre on 03.12.2025.
//

import SwiftUI
import AnimeListAPI

struct OngoingView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @Bindable var homeViewModel: HomeViewModel

    var body: some View {
        ScrollViewReader { proxy in
            ZStack(alignment: .center) {
                VStack {
                    HStack {
                        Title(title: "Ongoing shows")
                        Spacer()
                        CapsuleButton(title: "See more", font: Font.custom(FontNames.mulish.rawValue, size: 10), color: .grey) {
                            guard homeViewModel.ongoingHasNextPage else { return }
                            
                            Task {
                                homeViewModel.ongoingNeedsReload = true
                                await homeViewModel.loadOngoingAnime()
                            }
                        }
                    }
                    .padding(.bottom, 16)
                    
                    ScrollView(.horizontal) {
                        HStack(alignment: .top, spacing: 16) {
                            ForEach(homeViewModel.ongoingAnimeList) { anime in
                                OngoingCellView(anime: anime)
                                    .onTapGesture {
                                        coordinator.push(page: .details(anime: anime))
                                    }
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                }
                if homeViewModel.isLoadingOngoingList {
                    ProgressView()
                        .progressViewStyle(.circular)
                }
            }
            .onChange(of: homeViewModel.ongoingAnimeList.count) { oldCount, newCount in
                if newCount > oldCount {
                    // The view has been updated with new items.
                    // We can now safely scroll to the first new item.
                    let firstNewAnimeID = homeViewModel.ongoingAnimeList[oldCount].id
                    withAnimation(.bouncy(duration: 1)) {
                        proxy.scrollTo(firstNewAnimeID, anchor: .leading)
                    }
                }
            }
        }
    }
}

#Preview {
    let homeViewModel: HomeViewModel = {
        let vm = HomeViewModel()
        vm.ongoingAnimeList = [
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

    OngoingView(homeViewModel: homeViewModel)
        .environmentObject(Coordinator())
}
