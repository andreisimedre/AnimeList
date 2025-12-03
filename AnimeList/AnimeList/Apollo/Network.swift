//
//  Network.swift
//  AnimeList
//
//  Created by Andrei Simedre on 03.12.2025.
//

import Foundation
import Apollo

class Network {
    static let shared = Network()
    private(set) lazy var apollo = ApolloClient(url: URL(string: "https://graphql.anilist.co")!)
}

