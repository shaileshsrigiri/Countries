//
//  NetworkService.swift
//  Countries
//
//  Created by Shailesh Srigiri on 3/27/25.
//

import Foundation

final class NetworkService: NetworkServiceProtocol {
    
    static let shared = NetworkService()
    private init() {}

    func fetchData<T: Decodable>(from urlString: String) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)

        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingFailed
        }
    }
}
