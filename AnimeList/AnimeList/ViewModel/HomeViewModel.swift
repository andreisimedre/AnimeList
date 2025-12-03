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
    private var currentPage: Int = 0
    private(set) var hasNextPage: Bool = false

    var needsReload: Bool = false

    func loadAnime(status: MediaStatus? = nil) async {
        guard animeList.isEmpty || needsReload else { return }
        needsReload = false

        do {
            let nextPage = Int32(currentPage + 1)
            let data = try await Network.shared.apollo.fetchAsync(
                query:
                    AnimeListQuery(perPage: 20,
                                   page: GraphQLNullable<Int32>(integerLiteral: nextPage),
                                   status: status == nil ? nil : .some(.case(status ?? .finished)),
                                   format: .some(.case(.tv))))

            self.currentPage = data.page?.pageInfo?.currentPage ?? 0
            self.hasNextPage = data.page?.pageInfo?.hasNextPage ?? false

            let animeDetails = data.page?.media?.compactMap { $0?.fragments.animeDetails } ?? []

            await MainActor.run {
                self.animeList.append(contentsOf: animeDetails.map { Anime(fragment: $0) })
            }
        } catch {
            print("Failed to fetch anime: \(error)")
        }
    }
}
