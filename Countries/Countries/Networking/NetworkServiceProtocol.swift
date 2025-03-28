//
//  NetworkServiceProtocol.swift
//  Countries
//
//  Created by Shailesh Srigiri on 3/27/25.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchData<T: Decodable>(from urlString: String) async throws -> T
}

