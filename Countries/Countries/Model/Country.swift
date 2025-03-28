//
//  Country.swift
//  Countries
//
//  Created by Shailesh Srigiri on 3/27/25.
//

import Foundation

struct Country: Decodable {
    let name: String
    let region: String
    let code: String
    let capital: String
}
