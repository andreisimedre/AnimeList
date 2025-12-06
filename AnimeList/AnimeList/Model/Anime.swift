//
//  Anime.swift
//  AnimeList
//
//  Created by Andrei Simedre on 03.12.2025.
//

import AnimeListAPI
import Foundation

struct CoverImage: Hashable {
    let large: String?
    let extraLarge: String?
}

struct Character: Identifiable, Hashable {
    let id: Int
    let name: String?
    let imageURL: String?
}

struct Anime: Identifiable, Hashable {
    let id: Int
    let siteUrl: String?
    let titleEnglish: String?
    let titleNative: String?
    let description: String?
    let averageScore: Int?
    let duration: Int?
    let genres: [String?]?
    let coverImage: CoverImage?
    let isAdult: Bool?
    var charaters: [Character]?
    let trailerUrl: URL?
    let trailerThumbnail: String?

    func getDuration() -> String {
        guard let duration = duration else { return "Not available" }
        let hours = duration / 60
        let minutes = duration % 60
        return "\(hours)h \(minutes)min"
    }

    init(fragment: AnimeDetails, characters: [Character]? = nil) {
        self.id = fragment.id
        self.siteUrl = fragment.siteUrl
        self.titleEnglish = fragment.title?.english
        self.titleNative = fragment.title?.native
        self.description = fragment.description?.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression)
        self.coverImage = CoverImage(large: fragment.coverImage?.large, extraLarge: fragment.coverImage?.extraLarge)
        self.averageScore = fragment.averageScore
        self.duration = fragment.duration
        self.genres = fragment.genres
        self.isAdult = fragment.isAdult
        self.charaters = characters

        if let trailer = fragment.trailer,
           let id = trailer.id,
           let site = trailer.site {
            self.trailerThumbnail = trailer.thumbnail

            // Build the URL based on the specific site
            switch site.lowercased() {
            case "youtube":
                // Standard YouTube Watch URL
                self.trailerUrl = URL(string: "https://www.youtube.com/watch?v=\(id)")

                // Note: If you want to embed it in a WebView, use:
                // "https://www.youtube.com/embed/\(id)"

            case "dailymotion":
                self.trailerUrl = URL(string: "https://www.dailymotion.com/video/\(id)")

            default:
                self.trailerUrl = nil
            }
        } else {
            self.trailerUrl = nil
            self.trailerThumbnail = nil
        }
    }

    init(
        id: Int,
        siteUrl: String = "",
        titleEnglish: String,
        titleNative: String = "",
        description: String = "This is a placeholder description for previews.",
        bannerImage: String = "",
        coverImage: CoverImage? = nil,
        averageScore: Int? = 85,
        duration: Int? = 100,
        genres: [String]? = ["Action", "Fantasy", "Adventure"],
        isAdult: Bool? = false,
        charaters: [Character]? = nil,
        trailerUrl: URL? = nil,
        trailerThumbnail: String? = nil
    ) {
        self.id = id
        self.siteUrl = siteUrl
        self.titleEnglish = titleEnglish
        self.titleNative = titleNative
        self.description = description
        self.coverImage = coverImage
        self.averageScore = averageScore
        self.duration = duration
        self.genres = genres
        self.isAdult = isAdult
        self.charaters = charaters
        self.trailerUrl = trailerUrl
        self.trailerThumbnail = trailerThumbnail
    }
}
