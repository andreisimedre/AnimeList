//
//  DetailsViewModel.swift
//  AnimeList
//
//  Created by Andrei Simedre on 05.12.2025.
//

import SwiftUI
import AnimeListAPI

@Observable class DetailsViewModel {
    let animeId: Int
    var anime: Anime?
    var needsReload: Bool = false
    var isLoading: Bool = false
    private var currentPage: Int = 0
    private var nextPage: Int = 0

    private(set) var hasNextPage: Bool = false

    init(animeId: Int) {
        self.animeId = animeId
    }

    func loadAnime() async {
        guard anime == nil || needsReload else { return }
        isLoading = true

        do {
            let nextPage = Int32(currentPage + 1)
            let data = try await Network.shared.apollo.fetchAsync(query: GetAnimeByIdQuery(
                id: GraphQLNullable<Int32>(integerLiteral: Int32.IntegerLiteralType(animeId)),
                page: GraphQLNullable<Int32>(integerLiteral: Int32.IntegerLiteralType(nextPage)),
                perPage: 20)

            )
            self.currentPage = data.media?.characters?.pageInfo?.currentPage ?? 0
            self.hasNextPage = data.media?.characters?.pageInfo?.hasNextPage ?? false

            let animeDetails = data.media?.fragments.animeDetails
            let charaters = data.media?.characters?.nodes?.compactMap{ $0 }.map {
                Character(
                    id: $0.id,
                    name: $0.name?.full,
                    imageURL: $0.image?.medium
                )
            }

            await MainActor.run {
                if let animeDetails = animeDetails {
                    if !needsReload {
                        self.anime = Anime(fragment: animeDetails, characters: charaters)
                    } else {
                        if let charaters = charaters {
                            for charater in charaters {
                                if self.anime?.charaters?.contains(where: { $0.id == charater.id }) ?? false {
                                    continue
                                }
                                self.anime?.charaters?.append(charater)
                            }
                        }
                    }
                    self.needsReload = false
                }
                self.isLoading = false
            }
        } catch {
            print("Failed to fetch anime: \(error)")
        }
    }
}
