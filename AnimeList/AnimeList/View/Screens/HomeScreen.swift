//
//  HomeScreen.swift
//  AnimeList
//
//  Created by Andrei Simedre on 03.12.2025.
//

import SwiftUI
import AnimeListAPI

struct HomeScreen: View {
    @EnvironmentObject private var coordinator: Coordinator
    @State var homeViewModel = HomeViewModel()

    var body: some View {
        VStack {
            Title(title: "Anime List")
            OngoingView(homeViewModel: homeViewModel)
            PopularAnimeView(homeViewModel: homeViewModel)
        }
        .padding(.horizontal)
        .task {
            await homeViewModel.loadAllAnime()
        }
    }
}

#Preview {
    HomeScreen()
}
