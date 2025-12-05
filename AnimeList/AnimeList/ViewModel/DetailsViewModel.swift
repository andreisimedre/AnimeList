//
//  DetailsViewModel.swift
//  AnimeList
//
//  Created by Andrei Simedre on 05.12.2025.
//

import SwiftUI
import AnimeListAPI

@Observable class DetailsViewModel {
    var anime: Anime?
    var needsReload: Bool = false
    var isLoading: Bool = false
    private var currentPage: Int = 0
    private var nextPage: Int = 0

    private(set) var hasNextPage: Bool = false

    init(id: Int) async {
        await loadAnime(id: id)
    }

    func loadAnime(id: Int) async {
        guard anime?.charaters?.isEmpty ?? true || needsReload else { return }
        needsReload = false
        isLoading = true

        do {
            let nextPage = Int32(currentPage + 1)
            let data = try await Network.shared.apollo.fetchAsync(query: GetAnimeByIdQuery(
                id: GraphQLNullable<Int32>(integerLiteral: Int32.IntegerLiteralType(id)),
                page: GraphQLNullable<Int32>(integerLiteral: Int32.IntegerLiteralType(nextPage)),
                perPage: 20)

            )
            self.currentPage = data.media?.characters?.pageInfo?.currentPage ?? 0
            self.hasNextPage = data.media?.characters?.pageInfo?.hasNextPage ?? false

            let animeDetails = data.media?.fragments.animeDetails
            let charaters = data.media?.characters?.nodes?.compactMap{ $0 }.map({ Character(name: $0.name?.full, imageURL: $0.image?.medium) })

            await MainActor.run {
                if let animeDetails = animeDetails {
                    self.anime = Anime(fragment: animeDetails, characters: charaters)
                }
                self.isLoading = false
            }
        } catch {
            print("Failed to fetch anime: \(error)")
        }
    }
}
