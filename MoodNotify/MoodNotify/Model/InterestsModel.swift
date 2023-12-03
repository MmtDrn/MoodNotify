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
    var id: String { name }
    
    static let interestsArray: [InterestsModel] = [.init(name: "Gaming", image: "🎮"),
                                            .init(name: "Dancing", image: "💃"),
                                            .init(name: "Music", image: "🎶"),
                                            .init(name: "Movie", image: "🎬"),
                                            .init(name: "Architecture", image: "🏛️"),
                                            .init(name: "Fashion", image: "👠"),
                                            .init(name: "Book", image: "📚"),
                                            .init(name: "Writing", image: "✍️"),
                                            .init(name: "Nature", image: "🌲"),
                                            .init(name: "Painting", image: "🎨"),
                                            .init(name: "Football", image: "⚽️"),
                                            .init(name: "Talk", image: "💬"),
                                            .init(name: "Animals", image: "🐾"),
                                            .init(name: "Gym&Fitness", image: "💪"),
                                            .init(name: "Photography", image: "📸")]
    
}
