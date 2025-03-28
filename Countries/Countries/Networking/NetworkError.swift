//
//  NetworkError.swift
//  Countries
//
//  Created by Shailesh Srigiri on 3/27/25.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case requestFailed
    case noData
    case decodingFailed

    var description: String {
        switch self {
        case .invalidURL: return "Invalid URL"
        case .requestFailed: return "Network request failed"
        case .noData: return "No data received"
        case .decodingFailed: return "Failed to decode response"
        }
    }
}
