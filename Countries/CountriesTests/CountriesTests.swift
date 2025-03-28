//
//  CountriesTests.swift
//  CountriesTests
//
//  Created by Shailesh Srigiri on 3/27/25.
//

import XCTest
@testable import Countries

final class CountriesTests: XCTestCase {

    var viewModel: CountriesViewModel!

    override func setUpWithError() throws {
        viewModel = CountriesViewModel(service: MockNetworkService())
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func test_fetchCountries_success() async throws {
        await viewModel.fetchCountries()

        XCTAssertEqual(viewModel.countries.count, 2)
        XCTAssertEqual(viewModel.filteredCountries.count, 2)

        let algeria = viewModel.countries.first { $0.name == "Algeria" }
        XCTAssertNotNil(algeria)
        XCTAssertEqual(algeria?.code, "DZ")
        XCTAssertEqual(algeria?.capital, "Algiers")
    }

    func test_filter_byName() async throws {
        await viewModel.fetchCountries()
        viewModel.filter(with: "Algeria")

        XCTAssertEqual(viewModel.filteredCountries.count, 1)
        XCTAssertEqual(viewModel.filteredCountries.first?.name, "Algeria")
    }

    func test_filter_byCapital() async throws {
        await viewModel.fetchCountries()
        viewModel.filter(with: "Pago")

        XCTAssertEqual(viewModel.filteredCountries.count, 1)
        XCTAssertEqual(viewModel.filteredCountries.first?.capital, "Pago Pago")
    }

    func test_filter_emptyQuery() async throws {
        await viewModel.fetchCountries()
        viewModel.filter(with: "")

        XCTAssertEqual(viewModel.filteredCountries.count, 2)
    }
    
    func test_filter_isCaseInsensitive() async {
        await viewModel.fetchCountries()
        viewModel.filter(with: "algeria") // lowercase

        XCTAssertEqual(viewModel.filteredCountries.count, 1)
        XCTAssertEqual(viewModel.filteredCountries.first?.name, "Algeria")

        viewModel.filter(with: "PAGO") // uppercase
        XCTAssertEqual(viewModel.filteredCountries.count, 1)
        XCTAssertEqual(viewModel.filteredCountries.first?.capital, "Pago Pago")
    }

    

}


