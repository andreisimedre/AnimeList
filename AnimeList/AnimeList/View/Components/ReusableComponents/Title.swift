//
//  Title.swift
//  AnimeList
//
//  Created by Andrei Simedre on 03.12.2025.
//

import SwiftUI

struct Title: View {
    let title: String

    var body: some View {
        Text(title)
            .font(Font.custom(FontNames.merriweather.rawValue, size: 16 * fontScale))
            .fontWeight(.heavy)
            .foregroundStyle(.darkBlue)
    }
}

#Preview {
    Title(title: "Anime List")
}
