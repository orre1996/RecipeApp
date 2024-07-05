//
//  NetworkManager.swift
//  RecipeApp
//
//  Created by Oscar Berggren on 2024-07-02.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()

    let session = URLSession.shared

    public func get<T: Decodable>(endpoint: Endpoint, date: Date? = nil) async -> Result<T, Error> {
        guard let url = URL(string: endpoint.path) else { return .failure(NetworkManagerError.invalidUrl) }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        do {
            let (data, response) = try await session.data(for: request)

            guard (response as? HTTPURLResponse)?.statusCode == 200 else { return .failure(NetworkManagerError.invalidRequest) }

            return .success(try JSONDecoder().decode(T.self, from: data))
        } catch {
            return .failure(NetworkManagerError.invalidData)
        }
    }
}
