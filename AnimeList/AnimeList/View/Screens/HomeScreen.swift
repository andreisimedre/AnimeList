//
//  HomeScreen.swift
//  AnimeList
//
//  Created by Andrei Simedre on 03.12.2025.
//

import SwiftUI
import AnimeListAPI

struct HomeScreen: View {
    @State var homeViewModel = HomeViewModel()

    var body: some View {
        VStack {
            Title(title: "Anime List")
            OngoingView(anime: homeViewModel.animeList, homeViewModel: $homeViewModel)
                .padding(.top, 16)
            Spacer()
        }
        .padding(.horizontal)
        .task {
            await homeViewModel.loadAnime(status: .releasing)
        }
    }
}

#Preview {
    HomeScreen()
}
