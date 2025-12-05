//
//  Anime.swift
//  AnimeList
//
//  Created by Andrei Simedre on 03.12.2025.
//

import AnimeListAPI

struct Anime: Identifiable, Hashable {
    let id: Int
    let siteUrl: String?
    let titleEnglish: String?
    let titleNative: String?
    let description: String?
    let bannerImage: String?
    let coverImage: String?
    let averageScore: Int?
    let duration: Int?
    let genres: [String?]?

    func getDuration() -> String {
        guard let duration = duration else { return "Not available" }
        let hours = duration / 60
        let minutes = duration % 60
        return "\(hours)h \(minutes)m"
    }

    init(fragment: AnimeDetails) {
        self.id = fragment.id
        self.siteUrl = fragment.siteUrl
        self.titleEnglish = fragment.title?.english
        self.titleNative = fragment.title?.native
        self.description = fragment.description
        self.bannerImage = fragment.bannerImage
        self.coverImage = fragment.coverImage?.large
        self.averageScore = fragment.averageScore
        self.duration = fragment.duration
        self.genres = fragment.genres
    }

    init(
        id: Int,
        siteUrl: String = "",
        titleEnglish: String,
        titleNative: String = "",
        description: String = "This is a placeholder description for previews.",
        bannerImage: String = "",
        coverImage: String = "",
        averageScore: Int? = 85,
        duration: Int? = 100,
        genres: [String]? = ["Action", "Fantasy", "Adventure"]
    ) {
        self.id = id
        self.siteUrl = siteUrl
        self.titleEnglish = titleEnglish
        self.titleNative = titleNative
        self.description = description
        self.bannerImage = bannerImage
        self.coverImage = coverImage
        self.averageScore = averageScore
        self.duration = duration
        self.genres = genres
    }
}
