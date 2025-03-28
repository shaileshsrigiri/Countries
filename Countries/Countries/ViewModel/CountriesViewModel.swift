//
//  CountriesViewModel.swift
//  Countries
//
//  Created by Shailesh Srigiri on 3/27/25.
//

import Foundation

class CountriesViewModel: @unchecked Sendable {
    private let service: NetworkServiceProtocol

    private(set) var countries: [Country] = []
    private(set) var filteredCountries: [Country] = []

    var onDataUpdated: (() -> Void)?
    var onError: ((String) -> Void)?

    init(service: NetworkServiceProtocol = NetworkService.shared) {
        self.service = service
    }

    func fetchCountries() async {
     
            do {
                let result: [Country] = try await service.fetchData(from: APIEndpoint.countriesList)
                self.countries = result
                self.filteredCountries = result
                DispatchQueue.main.async {
                    self.onDataUpdated?()
                }
            } catch let error as NetworkError {
                DispatchQueue.main.async {
                    self.onError?(error.description)
                }
            } catch {
                DispatchQueue.main.async {
                    self.onError?("Unknown error occurred")
                }
            }
        
    }

    func filter(with query: String) {
        guard !query.isEmpty else {
            filteredCountries = countries
            onDataUpdated?()
            return
        }

        filteredCountries = countries.filter {
            $0.name.lowercased().contains(query.lowercased()) ||
            $0.capital.lowercased().contains(query.lowercased())
        }
        onDataUpdated?()
    }
}
