//
//  PosterCellView.swift
//  AnimeList
//
//  Created by Andrei Simedre on 03.12.2025.
//

import SwiftUI
import AnimeListAPI

struct PosterCellView: View {
    let rows = [GridItem(.fixed(100))]

    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows) {
                    ForEach(0x1f600...0x1f679, id: \.self) { value in
                        VStack {
                        Text(String(format: "%x", value))
//                        Text(emoji(value) + "long text")
//                            .font(.largeTitle)
                    }
                }
            }
        }
    }
}

#Preview {
    PosterCellView()
}
