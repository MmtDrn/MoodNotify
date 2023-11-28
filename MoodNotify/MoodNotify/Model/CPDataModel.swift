//
//  CPDataModel.swift
//  MoodNotify
//
//  Created by mehmet duran on 28.11.2023.
//

import Foundation

struct CPDataModel: Codable, Identifiable {
    let id: String
    let name: String
    let flag: String
    let code: String
    let dial_code: String
    let pattern: String
    let limit: Int
    
    static let allCountry: [CPDataModel] = Bundle.main.decode("CountryNumbers.json")
    static let example = allCountry[0]
}
