//
//  InterestsModel.swift
//  MoodNotify
//
//  Created by mehmet duran on 1.12.2023.
//

import Foundation

struct InterestsModel: Identifiable, Hashable {
    let name: String
    let image: String
    var isSelected: Bool
    var id: String { name } 
}
