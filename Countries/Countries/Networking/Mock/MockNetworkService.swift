//
//  MockNetworkService.swift
//  Countries
//
//  Created by Shailesh Srigiri on 3/27/25.
//


import Foundation

class MockNetworkService: NetworkServiceProtocol {
    func fetchData<T: Decodable>(from urlString: String) async throws -> T {

        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingFailed
        }
    }
}



let mockJSON = """
[
    {
      "capital": "Algiers",
      "code": "DZ",
      "currency": {
        "code": "DZD",
        "name": "Algerian dinar",
        "symbol": "د.ج"
      },
      "flag": "https://restcountries.eu/data/dza.svg",
      "language": {
        "code": "ar",
        "name": "Arabic"
      },
      "name": "Algeria",
      "region": "AF"
    },
    {
      "capital": "Pago Pago",
      "code": "AS",
      "currency": {
        "code": "USD",
        "name": "United State Dollar",
        "symbol": "$"
      },
      "flag": "https://restcountries.eu/data/asm.svg",
      "language": {
        "code": "en",
        "name": "English"
      },
      "name": "American Samoa",
      "region": "OC"
    }
]
"""

let data = Data(mockJSON.utf8)
