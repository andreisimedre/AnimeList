//
//  GenreCapsuleView.swift
//  AnimeList
//
//  Created by Andrei Simedre on 05.12.2025.
//

import SwiftUI

struct GenreCapsuleView: View {
    let genre: String

    var body: some View {
        Text(genre)
            .font(Font.custom(FontNames.mulish.rawValue, size: 8))
            .fontWeight(.bold)
            .foregroundStyle(.midBlue)
            .padding(.horizontal, 12)
            .padding(.vertical, 4)
            .background(Capsule().foregroundStyle(.lightBlue))
    }
}

#Preview {
    GenreCapsuleView(genre: "Action")
}
