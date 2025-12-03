//
//  CoordinatorView.swift
//  AnimeList
//
//  Created by Andrei Simedre on 03.12.2025.
//

import Foundation
import SwiftUI

struct CoordinatorView: View {
    @StateObject private var coordinator = Coordinator()

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.rootView()
                .navigationDestination(for: AppPages.self) { page in
                    coordinator.build(page: page)
                }
                .sheet(item: $coordinator.sheet) { sheet in
                    coordinator.build(page: sheet)
                }
                .fullScreenCover(item: $coordinator.fullScreenCover) { item in
                    coordinator.build(page: item)
                }
        }
        .environmentObject(coordinator)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    CoordinatorView()
}

#Preview("Dark Mode") {
    CoordinatorView()
        .preferredColorScheme(.dark)
}
