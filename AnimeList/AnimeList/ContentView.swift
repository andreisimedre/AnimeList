//
//  ContentView.swift
//  AnimeList
//
//  Created by Andrei Simedre on 02.12.2025.
//

import SwiftUI
import AnimeListAPI
import Apollo

struct ContentView: View {
    @State private var description: String = ""

    var body: some View {
        VStack {
            Text(description)
                .onAppear {
                    Task {
                        do {
                            let result = try await Network.shared.apollo.fetch(query: AnimeListQuery(perPage: 1))

                            if let description = result.data?.page?.media?.first??.description {
                                await MainActor.run {
                                    self.description = description
                                }
                            }

                            if let errors = result.errors, !errors.isEmpty {
                                print("GraphQL Errors: \(errors)")
                            }
                        } catch {
                            print("Network Error: \(error)")
                        }
                    }
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
