//
//  AnimeDetails.swift
//  AnimeList
//
//  Created by Andrei Simedre on 03.12.2025.
//

import AnimeListAPI

struct Anime {
    let siteUrl: String
    let titleEnglish: String
    let titleNative: String
    let description: String
    let bannerImage: String
    let coverImage: String

    init(fragment: AnimeDetails) {
        self.siteUrl = fragment.siteUrl
        self.titleEnglish = fragment.media.titleEnglish
        self.titleNative = fragment.media.titleNative
        self.description = fragment.media.description
        self.bannerImage = fragment.media.bannerImage
        self.coverImage = fragment.media.coverImage
    }
}
