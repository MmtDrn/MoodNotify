//
//  PositionKey.swift
//  MoodNotify
//
//  Created by mehmet duran on 10.01.2024.
//

import SwiftUI

struct PositionKey: PreferenceKey {
    static var defaultValue: CGRect = .zero
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}
