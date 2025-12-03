//
//  HomeScreen.swift
//  AnimeList
//
//  Created by Andrei Simedre on 03.12.2025.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        Title(title: "Anime List")
        NowShowingView()
            .padding(.top, 16)

        Spacer()
    }
}

#Preview {
    HomeScreen()
}
