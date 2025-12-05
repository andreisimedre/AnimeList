//
//  HomeViewModel.swift
//  AnimeList
//
//  Created by Andrei Simedre on 03.12.2025.
//

import SwiftUI
import AnimeListAPI

@Observable class HomeViewModel {
    var ongoingAnimeList: [Anime] = []
    var popularAnimeList: [Anime] = []

    private var ongoingCurrentPage: Int = 0
    private var popularCurrentPage: Int = 0

    private(set) var ongoingHasNextPage: Bool = false
    private(set) var popularHasNextPage: Bool = false

    var ongoingNeedsReload: Bool = false
    var popularNeedsReload: Bool = false

    var isLoadingOngoingList: Bool = false
    var isLoadingPopularList: Bool = false

    func loadOngoingAnime() async {
        guard ongoingAnimeList.isEmpty || ongoingNeedsReload else { return }
        ongoingNeedsReload = false
        isLoadingOngoingList = true

        do {
            let nextPage = Int32(ongoingCurrentPage + 1)
            let data = try await Network.shared.apollo.fetchAsync(
                query:
                    AnimeListQuery(perPage: 20,
                                   page: GraphQLNullable<Int32>(integerLiteral: nextPage),
                                   status: .some(.case(.releasing)),
                                   format: .some(.case(.tv)),
                                   sort: nil
                                  )
            )

            self.ongoingCurrentPage = data.page?.pageInfo?.currentPage ?? 0
            self.ongoingHasNextPage = data.page?.pageInfo?.hasNextPage ?? false

            let animeDetails = data.page?.media?.compactMap { $0?.fragments.animeDetails } ?? []

            await MainActor.run {
                self.ongoingAnimeList.append(contentsOf: animeDetails.map { Anime(fragment: $0) })
                self.isLoadingOngoingList = false
            }
        } catch {
            print("Failed to fetch anime: \(error)")
        }
    }

    func loadPopularAnime() async {
        guard popularAnimeList.isEmpty || popularNeedsReload else { return }
        popularNeedsReload = false
        isLoadingPopularList = true

        do {
            let nextPage = Int32(popularCurrentPage + 1)
            let data = try await Network.shared.apollo.fetchAsync(
                query:
                    AnimeListQuery(perPage: 20,
                                   page: GraphQLNullable<Int32>(integerLiteral: nextPage),
                                   status: nil,
                                   format: .some(.case(.movie)),
                                   sort: .some([.case(.popularityDesc)])
                                   )
            )

            self.popularCurrentPage = data.page?.pageInfo?.currentPage ?? 0
            self.popularHasNextPage = data.page?.pageInfo?.hasNextPage ?? false

            let animeDetails = data.page?.media?.compactMap { $0?.fragments.animeDetails } ?? []

            await MainActor.run {
                self.popularAnimeList.append(contentsOf: animeDetails.map { Anime(fragment: $0) })
                self.isLoadingPopularList = false
            }
        } catch {
            print("Failed to fetch anime: \(error)")
        }
    }

    func loadAllAnime() async {
        await withTaskGroup(of: Void.self) { group in
            group.addTask {
                await self.loadOngoingAnime()
            }

            group.addTask {
                await self.loadPopularAnime()
            }
        }
    }
}
