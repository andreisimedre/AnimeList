//
//  HomeViewModel.swift
//  AnimeList
//
//  Created by Andrei Simedre on 03.12.2025.
//

import SwiftUI
import AnimeListAPI

@Observable class HomeViewModel {
    private(set) var animeList: [Anime] = []
    var currentPage = 0

    func loadAnime() async {
        do {
            let nextPage = Int32(currentPage + 1)
            let data = try await Network.shared.apollo.fetchAsync(query: AnimeListQuery(perPage: 20, page: GraphQLNullable<Int32>(integerLiteral: nextPage)))

            self.currentPage = data.page?.pageInfo?.currentPage ?? 0

            let animeDetails = data.page?.media?.compactMap { $0?.fragments.animeDetails } ?? []

            await MainActor.run {
                self.animeList = animeDetails.map { Anime(fragment: $0) }
            }
        } catch {
            print("Failed to fetch anime: \(error)")
        }
    }
}
