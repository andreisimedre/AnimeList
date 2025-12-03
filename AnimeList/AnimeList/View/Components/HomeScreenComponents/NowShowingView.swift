//
//  NowShowingView.swift
//  AnimeList
//
//  Created by Andrei Simedre on 03.12.2025.
//

import SwiftUI

struct NowShowingView: View {
    private func emoji(_ value: Int) -> String {
            guard let scalar = UnicodeScalar(value) else { return "?" }
            return String(Character(scalar))
        }
    var body: some View {
        HStack {
            Title(title: "Now showing")
            Spacer()
            CapsuleButton(title: "See more", font: Font.custom(FontNames.mulish.rawValue, size: 10), color: .grey)
        }
    }
}

#Preview {
    NowShowingView()
}
