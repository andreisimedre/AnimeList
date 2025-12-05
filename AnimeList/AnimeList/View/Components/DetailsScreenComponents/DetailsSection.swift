//
//  DetailsSection.swift
//  AnimeList
//
//  Created by Andrei Simedre on 05.12.2025.
//

import SwiftUI

struct DetailsSection: View {
    let viewModel: DetailsViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ScrollView(.vertical) {
                HStack(alignment: .top) {
                    Text(viewModel.anime?.titleEnglish ?? (viewModel.anime?.titleNative ?? "Unknown title"))
                        .font(.custom(FontNames.mulish.rawValue, size: 20))
                    Spacer()
                    Image(systemName: "bookmark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
                .padding(.top, 24)

                ScoreView(score: viewModel.anime?.averageScore)
                    .padding(.bottom, 16)

                if let genres = viewModel.anime?.genres {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(genres, id: \.self) { genre in
                                if let genre = genre {
                                    GenreCapsuleView(genre: genre)
                                }
                            }
                        }
                    }
                    .frame(height: 18)
                    .scrollIndicators(.hidden)
                }

                InfoView(anime: viewModel.anime)
                    .padding(.vertical, 16)
                Title(title: "Description")
                    .padding(.bottom, 16)
                Text(viewModel.anime?.description ?? "No description available")
                    .font(.custom(FontNames.mulish.rawValue, size: 12))
                    .foregroundStyle(.grey)
                HStack {
                    Title(title: "Cast")
                    Spacer()
                    CapsuleButton(title: "See more", font: .custom(FontNames.mulish.rawValue, size: 12), color: .grey) {
                        guard viewModel.hasNextPage else { return }

                        Task {
                            viewModel.needsReload = true
                            await viewModel.loadAnime()
                        }
                    }
                }
                .padding(.vertical, 16)

                if let charaters = viewModel.anime?.charaters {
                    ScrollViewReader { proxy in
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(charaters) { character in
                                    VStack(alignment: .leading, spacing: 0) {
                                        AsyncImage(url: URL(string: character.imageURL ?? "")) { image in
                                            image
                                                .resizable()
                                                .clipShape(RoundedRectangle(cornerRadius: 5))

                                        } placeholder: {
                                            Image("placeholderImage")
                                                .resizable()
                                        }
                                        .frame(width: 74, height: 74)
                                        Text(character.name ?? "Name unavailable")
                                            .font(.custom(FontNames.mulish.rawValue, size: 12))
                                            .foregroundStyle(.darkBlue)
                                        Spacer()
                                    }
                                    .frame(width: 74)
                                }
                            }
                        }
                        .scrollIndicators(.hidden)
                        .padding(.bottom, 32)
                        .onChange(of: viewModel.anime?.charaters?.count) { oldCount, newCount in
                            guard let newCount = newCount, let oldCount = oldCount else { return }
                            if newCount > oldCount {

                                let firstNewAnimeID = viewModel.anime?.charaters?[oldCount].id
                                withAnimation(.bouncy(duration: 1)) {
                                    proxy.scrollTo(firstNewAnimeID, anchor: .leading)
                                }
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 24)
            .background(.white)
            .clipShape(.rect(topLeadingRadius: 10, topTrailingRadius: 10))
        }
    }
}

#Preview {
    DetailsSection(viewModel: DetailsViewModel(animeId: 102))
}
