//
//  HomeScreen.swift
//  AnimeList
//
//  Created by Andrei Simedre on 03.12.2025.
//

import SwiftUI

struct HomeScreen: View {
    @State var homeViewModel = HomeViewModel()

    var body: some View {
        VStack {
            Title(title: "Anime List")
            NowAiringView(anime: homeViewModel.animeList)
                .padding(.top, 16)
                .task {
                    await homeViewModel.loadAnime()
                }

            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    HomeScreen()
}
