//
//  ScoreView.swift
//  AnimeList
//
//  Created by Andrei Simedre on 05.12.2025.
//

import SwiftUI

struct ScoreView: View {
    let score: Int?

    var body: some View {
        HStack {
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: 13, height: 13)
                .foregroundStyle(.starYellow)
            Text("\(String(score ?? 0))/100 Score")
                .font(.custom(FontNames.mulish.rawValue, size: 12 * fontScale))
                .foregroundColor(.grey)
        }
    }
}

#Preview {
    ScoreView(score: 10)
}
