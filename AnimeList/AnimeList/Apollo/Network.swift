import Foundation
import Apollo
import ApolloAPI

class Network {
    static let shared = Network()
    private(set) lazy var apollo = ApolloClient(url: URL(string: "https://graphql.anilist.co")!)
}

extension ApolloClient {

    func fetchAsync<Query: GraphQLQuery>(query: Query) async throws -> Query.Data {
        return try await withCheckedThrowingContinuation { continuation in
            self.fetch(query: query) { result in
                switch result {
                case .success(let graphQLResult):
                    if let data = graphQLResult.data {
                        continuation.resume(returning: data)
                    }
                    else if let errors = graphQLResult.errors, let firstError = errors.first {
                        let error = NSError(domain: "GraphQL", code: 1, userInfo: [NSLocalizedDescriptionKey: firstError.message ?? "Unknown GraphQL Error"])
                        continuation.resume(throwing: error)
                    }
                    else {
                        continuation.resume(throwing: URLError(.badServerResponse))
                    }

                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
