//
//  VideoPlayer.swift
//  AnimeList
//
//  Created by Andrei Simedre on 16.12.2025.
//

import SwiftUI
import AVKit

struct VideoPlayerScreen: View {
    let url: URL
    let player = AVPlayer()

    init(url: URL) {
        self.url = url
        let item = AVPlayerItem(url: url)
        player.replaceCurrentItem(with: item)
    }

    var body: some View {
        VideoPlayer(player: player)
            .ignoresSafeArea()
            .onAppear {
                player.play()
            }

    }
}

#Preview {
    let url = URL(string: "https://commondatastorage.googleapis.com/gtv-videos/sample/Big_Buck_Bunny.mp4")!
    VideoPlayerScreen(url: url)
}
