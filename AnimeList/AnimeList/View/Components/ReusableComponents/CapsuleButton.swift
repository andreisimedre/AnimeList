//
//  CapsuleButton.swift
//  AnimeList
//
//  Created by Andrei Simedre on 03.12.2025.
//

import SwiftUI

struct CapsuleButton: View {
    let title: String
    let font: Font
    let color: Color

    var body: some View {
        Text(title)
            .font(font)
            .foregroundStyle(color)
            .padding(.vertical, 4)
            .padding(.horizontal, 8)
            .background(Capsule().stroke(color, lineWidth: 1))
    }
}

#Preview {
    CapsuleButton(title: "See more", font: Font.custom("Mulish", size: 10), color: .grey)
}
