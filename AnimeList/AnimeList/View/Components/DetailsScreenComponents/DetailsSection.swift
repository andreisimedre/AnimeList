//
//  DetailsSection.swift
//  AnimeList
//
//  Created by Andrei Simedre on 05.12.2025.
//

import SwiftUI
import AVKit

struct DetailsSection: View {
    @EnvironmentObject private var coordinator: Coordinator
    let viewModel: DetailsViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ScrollView(.vertical) {
                HStack(alignment: .top) {
                    Text(viewModel.anime?.titleEnglish ?? (viewModel.anime?.titleNative ?? "Unknown title"))
                        .font(.custom(FontNames.mulish.rawValue, size: 20 * fontScale))
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

                Button {
                    if let url = URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4") {
                        coordinator.push(page: .videoPlayer(url: url))
                    }
                } label: {
                    Image(systemName: "play.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundStyle(.darkBlue)
                }

                Title(title: "Description")
                    .padding(.bottom, 16)
                Text(viewModel.anime?.description ?? "No description available")
                    .font(.custom(FontNames.mulish.rawValue, size: 12 * fontScale))
                    .foregroundStyle(.grey)
                HStack {
                    Title(title: "Cast")
                    Spacer()
                    CapsuleButton(title: "See more", font: .custom(FontNames.mulish.rawValue, size: 12 * fontScale), color: .grey) {
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
                                        .frame(width: isIpad ? 150 : 74, height: isIpad ? 150 : 74)
                                        Text(character.name ?? "Name unavailable")
                                            .font(.custom(FontNames.mulish.rawValue, size: 12  * fontScale))
                                            .foregroundStyle(.darkBlue)
                                        Spacer()
                                    }
                                    .frame(width: isIpad ? 150 : 74)
                                    .id(character.id)
                                }
                            }
                        }
                        .scrollIndicators(.hidden)
                        .padding(.bottom, 32)
                        .onChange(of: viewModel.anime?.charaters?.count) { oldCount, newCount in
                            guard let newCount, let oldCount, newCount > oldCount else { return }
                            
                            if let firstNewCharacterID = viewModel.anime?.charaters?[oldCount].id {
                                withAnimation(.bouncy(duration: 1)) {
                                    proxy.scrollTo(firstNewCharacterID, anchor: .leading)
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
