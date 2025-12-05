//
//  Coordinator.swift
//  AnimeList
//
//  Created by Andrei Simedre on 03.12.2025.
//

import Foundation
import SwiftUI
import Combine

enum AppPages: Hashable, Identifiable {
    var id: Self { self }

    case homeScreen
    case bookmarks
    case details(animeId: Int)

    static func == (lhs: AppPages, rhs: AppPages) -> Bool {
        switch (lhs, rhs) {
        case (.homeScreen, .homeScreen):
            return true
        case (.bookmarks, .bookmarks):
            return true
        case (.details(let lhsAnime), .details(let rhsAnime)):
            return lhsAnime == rhsAnime
        default:
            return false
        }
    }

    func hash(into hasher: inout Hasher) {
        switch self {
        case .homeScreen:
            hasher.combine(0)
        case .bookmarks:
            hasher.combine(1)
        case .details(let animeId):
            hasher.combine(animeId)
        }
    }
}

class Coordinator: ObservableObject {
    @Published var path: NavigationPath = NavigationPath()
    @Published var sheet: AppPages?
    @Published var fullScreenCover: AppPages?

    func push(page: AppPages) {
        path.append(page)
    }

    func pop() {
        path.removeLast()
    }

    func popToRoot() {
        path.removeLast(path.count)
    }

    func presentSheet(_ sheet: AppPages) {
        self.sheet = sheet
    }

    func presentFullScreenCover(_ cover: AppPages) {
        self.fullScreenCover = cover
    }

    func dismissSheet() {
        self.sheet = nil
    }

    func dismissCover() {
        self.fullScreenCover = nil
    }

    @ViewBuilder
    func build(page: AppPages) -> some View {
        switch page {
        case .homeScreen: HomeScreen()
        case .bookmarks: BookmarksScreen()
        case .details(animeId: let id):
            DetailsScreen(animeId: id)
        }
    }

    @ViewBuilder
    func rootView() -> some View {
        homeView()
    }

    @ViewBuilder
    func homeView() -> some View {
        TabView {
            build(page: .homeScreen)
                .tabItem {
                    Label("Home", systemImage: "film")
                }
            build(page: .bookmarks)
                .tabItem {
                    Label("Bookmarks", systemImage: "bookmark.fill")
                }
        }
        .tint(.darkBlue)
    }
}
